$ docker login


$ docker pull alvessh/web-aula-docker:0.2

$ docker run -p 89:80 alvessh/web-aula-docker:0.2

docker ps
 1996  docker built -t web-aula-docker:0.2 .
 1997  docker build -t web-aula-docker:0.2 .
 1998  docker run -p 83:80 web-aula-docker:0.2
 1999  ls -lha
 2000  cat Dockerfile 
 2001  docker login
 2002  docker tag web-aula-docker:0.1 alvessh/web-aula-docker:0.1
 2003  docker image ls
docker push alvessh/web-aula-docker:0.1
docker image ls
docker tag web-aula-docker:0.2 alvessh/web-aula-docker:0.2
docker image ls
docker push alvessh/web-aula-docker:0.2
docker run -p 89:80 alvessh/web-aula-docker:0.2

docker run -p 81:80 -d web-aula-docker:0.1

docker stop 42ca3a

### para fazer a atividade.


## Builda a imagem (já coloca no padrao do seu dockerhub) 
$ docker build -t alvessh/atividade-alves:1.0 .

# executa a imagem local para testar as alterações.
$ docker run -p 1234:80 alvessh/atividade-alves:1.0

# Fazer login no dockerhub
$ docker login

# Enviar para o docker hub
$ docker push alvessh/atividade-alves:1.0
