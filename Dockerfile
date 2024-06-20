FROM ubuntu:latest

## packages
RUN  apt-get -y update && apt-get install -y \
	vim.tiny \
	curl \
	opus-tools sox \
	fortune file \
	python3 pip  \
	&& rm -rf /var/lib/apt/lists/*
RUN pip3 install piper-tts

RUN  mkdir /tmp/out

COPY app/ /app/
RUN  chmod 664 /app/*.py /app/*.sh
WORKDIR /app
RUN /bin/bash /app/get_voices.sh
RUN /bin/curl -LO https://github.com/rhasspy/piper/activity

ENTRYPOINT /bin/sh /app/launch.sh

##docker build -t mcp_spake . && docker run -it -v ./out:/tmp/out --entrypoint /bin/bash mcp_spake

