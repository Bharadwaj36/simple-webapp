FROM ubuntu

WORKDIR /opt/ 

RUN	apt-get update -y 
RUN	apt-get install -y python3 && \
	apt-get install -y epel-release && \
	apt-get install -y python3-pip 

RUN	apt-get install -y mysql

RUN     pip3 install flask && \
        pip3 install flask-mysql

COPY ./simple-webapp/app.py /opt/
COPY ./script.sh /opt/
RUN chmod +x /opt/script.sh
ENTRYPOINT ./script.sh ; /bin/bash 
