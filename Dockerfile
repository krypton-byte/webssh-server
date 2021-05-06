FROM python:3.9
RUN set -ex;\
    apt-get update;\
    apt-get install build-essential cmake git libjson-c-dev libwebsockets-dev fakeroot proot byobu neofetch ffmpeg neofetch vim nano nmap byobu nodejs npm ruby ruby-dev -y
#Pentest Tool Download
RUN mkdir /home/user
ENV TERM=xterm
WORKDIR /home/user
RUN gem install wpscan
RUN python3 -m pip install sqlmap
RUN set -ex;\
    apt-get install whatweb -y
RUN git clone https://github.com/tsl0922/ttyd.git
RUN git clone https://github.com/OWASP/joomscan
RUN cd ttyd && mkdir build && cd build && cmake .. && make && make install
COPY . /home/user
CMD ttyd -p ${PORT} bash session.sh
