from debian:wheezy

env  TERM=xterm

run  apt-get update
run  apt-get install -y git vim make
run  mkdir -p /root/.vim/

copy . /root/.vim/
run  cd /root/.vim/; make

workdir /root
entrypoint vim
