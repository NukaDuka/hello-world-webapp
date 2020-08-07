FROM ubuntu

RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

COPY . /opt/source
RUN pip3 install -r /opt/source/requirements.txt

CMD cd /opt/source; gunicorn app:app