#!/bin/bash

# Tornar o arquivo executável
chmod +x /home/DRMStuff/o11

# Criar o arquivo de serviço systemd
cat <<EOF > /etc/systemd/system/ott-o11-panel.service
[Unit]
Description=OTT O11 PANEL

[Service]
User=root
WorkingDirectory=/home/DRMStuff
ExecStart=/home/DRMStuff/o11 -p 2095 # Porta pode usar qualquer outra da sua preferência.
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

# Recarregar os arquivos de serviço do systemd
systemctl daemon-reload

# Habilitar o serviço para iniciar automaticamente
systemctl enable ott-o11-panel.service

# Iniciar o serviço
systemctl start ott-o11-panel.service

# Exibir informações do sistema (opcional)
echo "Instalação concluída."