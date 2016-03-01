# docker-pagure
docker pagure for git.

#Docker image build
docker build -t "pagure-lab:latest" . 
#Docker container run
docker run -it -v /home/pagure:/home -p 8800:8800 pagure-lab:latest /bin/bash
#Service start
cd /usr/share/pagure/
./runserver.py
