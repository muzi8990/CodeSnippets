# -*- coding: utf-8 -*-
from __future__ import absolute_import
from typing import Text
from pydantic import BaseModel, Field
from fastapi import FastAPI
from fastapi.responses import (
    StreamingResponse as FastAPIStreamingResponse,
    JSONResponse)

app = FastAPI()


class RequestModel(BaseModel):
    content: Text
    stream: bool = Field(
        default=True,
        description="Whether to stream back partial progress. "
    )


class StreamingResponse(FastAPIStreamingResponse):
    media_type = 'text/plain'


def iter_from_stream(request: RequestModel):
    import time
    for response in request.content.split("\n"):
        time.sleep(1)
        yield response + "\n"


@app.post(path="/stream")
def stream_forward(request: RequestModel):
    if request.stream:
        return StreamingResponse(
            content=iter_from_stream(request=request),
            headers={
                "Content-Type": "text/event-stream",
                "Cache-Control": "no-cache",
                "Connection": "keep-alive",
                "Access-Control-Allow-Origin": "*"}
        )
    return JSONResponse(
        status_code=404,
        content={
            "message": "The stream must be set True。"
        }
    )


def main():
    import resource
    from pathlib import Path
    from uvicorn import run as uvicorn_main
    from uvicorn.config import LOGGING_CONFIG
    
    # resource.setrlimit(resource.RLIMIT_STACK, (resource.RLIM_INFINITY, resource.RLIM_INFINITY))
    resource.setrlimit(resource.RLIMIT_NOFILE, (65536, 65536))

    # noinspection SpellCheckingInspection
    LOGGING_CONFIG["formatters"]["default"]["fmt"] = (
        "%(asctime)s "
        "%(levelprefix)s "
        "%(name)s "
        "%(processName)s.%(threadName)s[%(process)d.%(thread)d]: "
        "%(message)s")
    # noinspection SpellCheckingInspection
    LOGGING_CONFIG["formatters"]["access"]["fmt"] = (
        '%(asctime)s '
        '%(levelprefix)s '
        '%(client_addr)s - "%(request_line)s" %(status_code)s')

    uvicorn_main(
        app=f"{Path(__file__).stem}:app",
        host="0.0.0.0",
        port=58080,
        # workers=0,
        log_config=LOGGING_CONFIG)


def test_client():
    import json
    import requests

    url = 'http://127.0.0.1:58080/stream'
    content = """Server-sent events：一个网页获取新的数据通常需要发送一个请求到服务器，也就是向服务器请求的页面。
    使用 server-sent 事件，服务器可以在任何时刻向我们的 Web 页面推送数据和信息。
    这些被推送进来的信息可以在这个页面上作为 Events + data 的形式来处理。"""

    response = requests.post(
        url=url,
        data=json.dumps(dict(content=content)),
        headers={"accept": "text/plain", "Content-Type": "application/json"},
        stream=True
    )

    for line in response.iter_lines():
        print(line.decode("UTF8"))
