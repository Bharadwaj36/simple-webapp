FROM ubuntu

WORKDIR /opt/ 

RUN	apt-get update -y 
RUN	apt-get install -y python3 && \
	apt-get install -y python3-pip 

RUN     pip3 install flask && \
        pip3 install flask-mysql

COPY /app.py /opt/
COPY ./script.sh /opt/
RUN chmod +x /opt/script.sh
EXPOSE 5000
ENTRYPOINT ./script.sh ; /bin/bash 
