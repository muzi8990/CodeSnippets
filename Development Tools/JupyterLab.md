# [JupyterLab](https://jupyter.org/): A Next-Generation Notebook Interface

---

```shell
pip install jupyterlab ipywidgets rich[jupyter] --upgrade --no-cache -i https://mirror.baidu.com/pypi/simple
```

---

```shell
jupyter lab \
--allow-root \
--no-browser \
--ServerApp.allow_remote_access=True \
--ServerApp.password_required=True \
--ServerApp.password="sha1:b91a66df6859:5e21b3c8ebcc909142b5a59f9b86d119612bde92" \
--ServerApp.ip=0.0.0.0 \
--ServerApp.port=8888 \
--ServerApp.root_dir=$HOME/.jupyter/lab/workspaces
```

# Template

```shell
export JupyterLabHome=${HOME}/.jupyter
mkdir -p "${JupyterLabHome}"/workspaces
export JupyterLabConfig=${JupyterLabHome}/jupyter_lab_config.py
# shellcheck disable=SC2086
test -e "${JupyterLabConfig}" && rm ${JupyterLabConfig}

jupyter lab --generate-config --config="${JupyterLabConfig}"


cat << EOF | sudo tee -a "${JupyterLabConfig}"
# ========== JupyterLab Config Start =========
c.ServerApp.root_dir = "${JupyterLabHome}/workspaces"

c.ServerApp.allow_root = True
c.ServerApp.allow_remote_access = True

c.ServerApp.open_browser = False
c.ExtensionApp.open_browser = False
# c.LabServerApp.open_browser = False
# c.LabApp.expose_app_in_browser = False
# c.LabApp.open_browser = False

from jupyter_server.auth import passwd
c.ServerApp.password_required = True
c.ServerApp.allow_password_change = True
c.ServerApp.password = passwd('666')

c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 9000

c.ServerApp.iopub_msg_rate_limit = 1000000
# ========== JupyterLab Config End =========
EOF

# jupyter lab --config=${JupyterLabConfig}
sudo ufw allow 9000

cat << EOF | sudo tee "/etc/systemd/system/JupyterLab.service"

[Unit]
Description=Jupyter Lab Server

[Service]
User=${USER}
Group=${USER}
Type=simple
WorkingDirectory=${JupyterLabHome}/workspaces
ExecStart=$(which jupyter)-lab --config=${JupyterLabConfig}
StandardOutput=null
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo systemctl start JupyterLab
sudo systemctl status JupyterLab
sudo systemctl enable JupyterLab
```

sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
sudo chcon --type=bin_t "$(which jupyter)"
