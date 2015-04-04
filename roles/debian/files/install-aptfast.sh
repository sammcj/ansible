#!/bin/bash
apt-get install -y aria2
wget https://github.com/ilikenwf/apt-fast/archive/master.zip
unzip master.zip && rm master.zip
cp apt-fast-master/apt-fast /usr/bin
cp apt-fast-master/apt-fast.conf /etc
cp apt-fast-master/man/apt-fast.8 /usr/share/man/man8
cp apt-fast-master/completions/bash/apt-fast /etc/bash_completion.d/
chown root:root /etc/bash_completion.d/apt-fast
. /etc/bash_completion
echo "DOWNLOADBEFORE=true" >> /etc/apt-fast.conf
echo "MIRRORS=( 'http://mirror.internode.on.net/pub/debian, http://ftp.au.debian.org/debian' )" >> /etc/apt-fast.conf
rm -rf apt-fast-master
echo "apt-fast installed"
