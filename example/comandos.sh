$ docker login


$ docker pull alvessh/web-aula-docker:0.2

$ docker run -p 89:80 alvessh/web-aula-docker:0.2

1995  docker ps
 1996  docker built -t web-aula-docker:0.2 .
 1997  docker build -t web-aula-docker:0.2 .
 1998  docker run -p 83:80 web-aula-docker:0.2
 1999  ls -lha
 2000  cat Dockerfile 
 2001  docker login
 2002  docker tag web-aula-docker:0.1 alvessh/web-aula-docker:0.1
 2003  docker image ls
 2004  docker push alvessh/web-aula-docker:0.1
 2005  docker image ls
 2006  docker tag web-aula-docker:0.2 alvessh/web-aula-docker:0.2
 2007  docker image ls
 2008  docker push alvessh/web-aula-docker:0.2
 2009  docker run -p 89:80 alvessh/web-aula-docker:0.2
 2010  history 

docker run -p 81:80 -d web-aula-docker:0.1

docker stop 42ca3a

