from debian:latest

env TERM=xterm

run  \
  apt-get update && \
  apt-get install -y golang git vim make && \
  apt-get autoremove && \
  apt-get clean

run  mkdir -p /root/.vim/
copy . /root/.vim/
run  cd /root/.vim/; make

workdir /root
entrypoint vim
