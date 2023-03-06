package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"io"
	"net/http"
	"strings"
	"time"
)

type RequestBody struct {
	Content string `json:"content"`
}

func main() {
	router := gin.Default()

	router.POST("/stream", stream)

	router.Run(":8080")
}

func stream(c *gin.Context) {
	flusher, ok := c.Writer.(http.Flusher)

	if !ok {
		c.AbortWithError(http.StatusInternalServerError, errors.New("streaming unsupported"))
		return
	}

	c.Writer.Header().Set("Content-Type", "text/event-stream")
	c.Writer.Header().Set("Cache-Control", "no-cache")
	c.Writer.Header().Set("Connection", "keep-alive")
	c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
	c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type")

	body, err := io.ReadAll(c.Request.Body)
	if err != nil {
		c.AbortWithError(http.StatusInternalServerError, fmt.Errorf("failed to read from body: %s", err.Error()))
	}

	var payload RequestBody
	if err := json.Unmarshal(body, &payload); err != nil {
		c.AbortWithError(http.StatusUnprocessableEntity, errors.New("value_error"))
	}

	for _, line := range strings.Split(payload.Content, "\n") {
		time.Sleep(time.Duration(1) * time.Second)
		io.WriteString(c.Writer, line+"\n")
		flusher.Flush()
	}
}
