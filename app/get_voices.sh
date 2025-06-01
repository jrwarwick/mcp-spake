echo getting onnx files
while read URI ; do
        curl -LOJ $URI
done <voicedownloadlist.txt

echo getting onnx.json companion files
for V in *.onnx.json ; do
	echo  ${V//\.onnx\.json/} >> voicenames.txt
done

echo having piper load up...
while read VN ; do
	piper --update-voices -m $VN > piper_progress.txt
done <voicenames.txt
