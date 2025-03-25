FROM ubuntu:jammy

## packages
RUN  apt-get -y update && apt-get install -y \
	curl \
	opus-tools sox \
	fortune file \
	vim.tiny \
	python3 pip  \
	&& rm -rf /var/lib/apt/lists/*
RUN pip3 install -v piper-tts
#RUN ls /tmp
#RUN python3 --version ; pip3 --version ; sleep 3
#RUN ls -lF '/etc/*release*' ; cat /etc/os-release /etc/issue > /tmp/info
#RUN cat /tmp/info ; sleep 12
#RUN pip3 install --break-system-packages --force-reinstall -v "piper-tts==1.2.0"
#RUN pip3 install --break-system-packages --force-reinstall -v piper-phonemize
#RUN pip3 install --break-system-packages --force-reinstall -v piper-tts

RUN  mkdir /tmp/out

COPY app/ /app/
RUN  chmod 664 /app/*.py /app/*.sh
WORKDIR /app
RUN /bin/bash /app/get_voices.sh
RUN /bin/curl -LO https://github.com/rhasspy/piper/activity

ENTRYPOINT /bin/sh /app/launch.sh

##quick start up hint## docker build -t mcp_spake . && docker run -it -v ./out:/tmp/out -p 8089:8089 --entrypoint /bin/bash mcp_spake

