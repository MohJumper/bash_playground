#!/bin/bash

# script that merge mutliple pcap files into one and
# convert them into one json file using tshark
# remeber to make this file executable >>>  chmod 755 fileName
# make sure this file is in the same dir as the pcap files.

# install tshark
if ! command -v tshark &>/dev/null; then
	sudo apt install tshark
	echo tshark is installed in your system ...
fi

echo type the name of merge pcap file:
read pcapMergedFile

# merge all files into one pcap 
mergecap -F pcap -w $pcapMergedFile.pcap *.pcap

# convert to json using tshark
tshark -r $pcapMergedFile.pcap -T json > $pcapMergedFile.json

echo process is completed ... 
