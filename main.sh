for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


    sudo docker run --detach \
    --hostname gitlab.standby.dev.br \
    --publish 8443:443 --publish 8080:80 --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume $GITLAB_HOME/config:/etc/gitlab \
    --volume $GITLAB_HOME/logs:/var/log/gitlab \
    --volume $GITLAB_HOME/data:/var/opt/gitlab \
    --shm-size 256m \
    gitlab/gitlab-ee:latest


sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password


sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials ${CREDENTIALS} -d "api-hamburgueria.standby.dev.br"
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials ${CREDENTIALS} -d "app-hamburgueria.standby.dev.br"
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials ${CREDENTIALS} -d "api-sorveteria.standby.dev.br"
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials ${CREDENTIALS} -d "app-sorveteria.standby.dev.br"

npx json-server --watch db.json --port 9090 --host 0.0.0.0


sudo vim /etc/systemd/system/back_hamburgueria.service


[Unit]
Description=Sorveteria backend
After=network.target

[Service]
ExecStart=/usr/bin/bash -c '/usr/bin/node /usr/bin/npx json-server --watch /opt/cardapio/sorveteria/sorveteria-backend/db.json --port 9000 --host $(ip addr show enp0s3 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")'
WorkingDirectory=/opt/cardapio/sorveteria/sorveteria-backend
Restart=always
User=usuario01
Group=usuario01

[Install]
WantedBy=multi-user.target


sudo systemctl daemon-reload
sudo systemctl start back_hamburgueria
sudo systemctl enable back_sorveteria


sudo ln -s /home/usuario01/.nvm/versions/node/v21.1.0/bin/npx /usr/bin/npx
sudo ln -s /home/usuario01/.nvm/versions/node/v21.1.0/bin/node /usr/bin/node

sudo journalctl -u back_hamburgueria

sudo vim /etc/systemd/system/back_hamburgueria.service
sudo vim /etc/systemd/system/back_sorveteria.service
sudo vim /opt/cardapio/hamburgueria/hamburgueria-frontend/src/services/api.ts 
sudo systemctl daemon-reload
sudo systemctl restart back_hamburgueria
sudo systemctl restart front_hamburgueria
sudo systemctl restart back_sorveteria
