FROM ubuntu:16.04

RUN apt-get update; apt-get upgrade; apt-get install -y libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm build-essential wget git python


# Install Golang 1.9
#RUN wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz \
#    && tar -C /usr/local -xzf go1.9.linux-amd64.tar.gz \
#    && rm -f go1.9.linux-amd64.tar.gz \
#    && echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

RUN apt-get install -y curl
# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs

RUN npm install gulp-cli -g \
    && npm install gulp -D
#RUN wget https://nodejs.org/download/release/v7.9.0/node-v7.9.0-linux-x64.tar.gz \
#    && tar -C /usr/local --strip-components 1 -xzf node-v7.9.0-linux-x64.tar.gz \
#    && rm -f node-v7.9.0-linux-x64.tar.gz \
#    && echo "export PATH=$PATH:/usr/local/node/bin" >> ~/.bashrc
    #&& npm install gulp-cli -g && npm install gulp -D

ADD run.sh /
ENTRYPOINT ["/run.sh"]
