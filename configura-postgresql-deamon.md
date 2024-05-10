# Configuração de inicialização automática do PostgreSQL no Linux
### Guia simples para configurar o PostgreSQL para inicialização automática no Linux.

Este guia mostra como configurar o PostgreSQL para iniciar automaticamente durante a inicialização do servidor Linux. Vamos usar systemd para criar um serviço para o PostgreSQL.

## Passo 1: Crie um arquivo de serviço para o PostgreSQL

Crie um arquivo de serviço chamado `postgresql.service` em `/etc/systemd/system/`:

```bash
sudo nano /etc/systemd/system/postgresql.service
```

Adicione o seguinte conteúdo ao arquivo:

```bash
[Unit]
Description=PostgreSQL

[Service]
Type=oneshot
ExecStart=/etc/init.d/postgresql restart
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

[Arquivo postgresql.service](postgresql.service)

Salve o arquivo e saia do editor.

## Passo 2: Recarregue as unidades do systemd

Recarregue as unidades do systemd para reconhecer o novo serviço:

```bash
sudo systemctl daemon-reload
```

## Passo 3: Habilite o serviço

Habilite o serviço para iniciar automaticamente durante a inicialização:

```bash
sudo systemctl enable postgresql.service
```

Isso deve configurar o PostgreSQL para ser iniciado automaticamente durante a inicialização do sistema. Você pode reiniciar o servidor para testar se o serviço está sendo iniciado corretamente.


## Explicação da Seção do Arquivo de Serviço `postgresql.service`

## [Unit]

- **Description**: Esta é uma descrição do serviço.

## [Service]

- **Type**: Define o tipo de serviço. Neste caso, `oneshot` indica que o serviço será considerado ativo assim que o comando `ExecStart` terminar de ser executado. Ou seja, o serviço será iniciado apenas uma vez e não permanecerá em execução continuamente.

- **ExecStart**: Especifica o comando a ser executado para iniciar o serviço. Aqui, estamos utilizando `/etc/init.d/postgresql restart` para reiniciar o PostgreSQL.

- **RemainAfterExit**: Define se o systemd deve considerar o serviço ativo mesmo após o término do comando especificado em `ExecStart`. Definindo como `yes`, garantimos que o systemd considerará o serviço ativo mesmo após o reinício do PostgreSQL.

## [Install]

- **WantedBy**: Indica em qual alvo (target) do systemd este serviço deve ser iniciado. `multi-user.target` é um alvo que é atingido durante a inicialização do sistema em modo multiusuário.
