FROM fedora:latest
MAINTAINER gzfarmer "gzfarmer@gmail.com"

#nstall the needed system libraries
RUN dnf install -y git python-virtualenv libgit2-devel libjpeg-devel gcc libffi-devel redhat-rpm-config
RUN pip install --upgrade pip

#Retrieve the sources
RUN cd /usr/share/ && \
	git clone https://github.com/gzfarmer/pagure.git

#Install dependencies
RUN cd /usr/share/pagure && \
	pip install --upgrade pip && \
	pip install pygit2==0.23.* && \
	pip install -r requirements.txt

#Create the folder that will receive the projects, forks, docs, requests and tickets' git repo
RUN mkdir /usr/share/pagure/{repos,docs,forks,tickets,requests}

#Create the inital database scheme
RUN cd /usr/share/pagure/ && python createdb.py

WORKDIR /usr/share/pagure
EXPOSE 8800
