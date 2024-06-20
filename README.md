# MCP - Docker Container for Fun
Simple, quick, "ambience establishing" chatter generator in the manner and voice of the MCP. Fire this up and then point a web browser 
at the provided web service, find the mcp.html file and click on it, and you should have a quick and dirty 
background ominous chatter generator machine. For fun? RPG background? LARP? Something?

Add or remove lines from ./app/messages.txt to customize what messages are rendered and played.

Uses the excellent Piper python package for easy and impressive TTS.


# Usage
Quick-start one-line startup:
```docker build -t mcp_spake . && docker run -it --name mcp_spake -v ./out:/tmp/out -p 0:8080 mcp_spake```

and to see what port to specify in your web client (probably in another shell):
```docker container port mcp_spake```

Or if you want to build it, and start up an interactive shell you can mess around before you actually launch app/launch.sh inside the container:
```docker build -t mcp_spake . && docker run -it --name mcp_spake -v ./out:/tmp/out -p 0:8080 --entrypoint /bin/bash mcp_spake```

# License
This project is licensed under the MIT License - see the LICENSE file for details.


#TODO
 - Web UI: 
	- CEO glass table desk graphic and "STT" readout, animated.
	- embed source text into metadata tags and also parse them back out and display on page, pseudo-STT
	- baylonjs 3d model with sound-actuated ventrilloquism
	- Volume slider. 
	- some kind of simple form on UI web page that then allows for one-off text messages to be injected 
	- a few hidden soundboard buttons, like eyes and mouth each play one specific message on cue

 - LLM integration option to generatively create the chatter
	- eventually: could also grab STT and feed it back into an LLM. Like maybe it kind of responds to you.

 - fortune option

 - options for "publish" to shared path, or SCP to remote server, or some kind of icecast/mp3 stream, rtsp

 - appropriate credit for youtube inspirer and alan pope's voice, and piper
https://www.youtube.com/watch?v=HWl2trMmpzc
https://www.reddit.com/r/tron/comments/18me55v/recreating_the_voice_of_the_mcp_attempt_using/
reference: https://www.youtube.com/watch?v=u5sMT4L1wkM

 - would like some way to get that more sweeping, forceful, dismissive emotive tone that MCP had.

