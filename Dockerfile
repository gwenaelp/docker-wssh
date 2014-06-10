# wssh - SSH over websocket
# original software by Andrea Luzzardi

FROM debian:7.3

MAINTAINER Gwenaël Pluchon, info@gwenp.fr

RUN apt-get update
RUN apt-get install python python-dev git ssh python-pip gcc -y

RUN pip install setuptools flask gevent gevent-websocket paramiko

RUN git clone https://github.com/aluzzardi/wssh.git /root/wssh

RUN cd /root/wssh && python setup.py install


# Launch wsshd when launching the container
ENTRYPOINT ["wsshd"]

# wsshd runs by default on port 5000
EXPOSE 5000
