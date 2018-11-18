FROM ubuntu:18

# Install basic packages
RUN apt-get update && \
     apt-get install -y libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm  \
                        build-essential wget git python curl apt-transport-https

# Install node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Install gulp
RUN npm install gulp-cli -g \
    && npm install gulp -D

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" |tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

# Clean apt cache
RUN apt-get clean

ADD run.sh /
ENTRYPOINT ["/run.sh"]
