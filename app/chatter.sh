echo "MESSAGE: $MESSAGE"
BETTER_NAME=$( echo $MESSAGE | tr '[A-Z]' '[a-z]' | sed -e 's/ (on|to|the|on|with|as|of) //g' -e 's/ \+/_/g' -e 's/[^0-9a-z_]//g' -e 's/\([^_]\+\){8}_*.*//' )

if [ -r utterances/mcp_${BETTER_NAME}.ogg ] ; then
	echo "Uttereance already rendered, skipping!"
	exit 0
fi
#This is only if you want simulated conversation between multiple personalities#export VOICENAME=$(shuf -n 1 voicenames.txt)
export VOICENAME=$(head -1 voicenames.txt)
#echo $MESSAGE | piper --model en_US-lessac-medium --output_file input.wav
echo $MESSAGE | piper --model $VOICENAME --output_file input.wav
#sox input.wav -r 22050 input22k.wav ; mv input22k.wav input.wav
#STD edition
#sox input.wav krssht.wav  rdo.ogg sinc -n 32767 1000-6000 compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 overdrive 10
#sox krssht.wav input.wav sin_432.wav krssht.wav rdo_full.ogg sinc -n 32767 1000-6000 compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 overdrive 10

sox input.wav L.wav pitch -450 tempo 1.15 compand 0.3,1 6:-70,-60,-20 -5 -90 0.2
#sox input.wav L.wav pitch -456 tempo 1.16 chorus 0.7 0.9 55.0 0.4 0.25 2.0 -t
sox L.wav r.wav pad 0.033 0.0
sox r.wav R.wav bass +2
sox -M -c 1 L.wav -c 1 R.wav mcp_stereo.wav
sox mcp_stereo.wav mcp_utterance.wav flanger 5 3 0 77 5 triangle 0
#reverb and/or overdrive
sox mcp_utterance.wav mcp_utterance.ogg #overdrive 2

cp -p mcp_utterance.ogg utterances/mcp_${BETTER_NAME}.ogg

