FROM ubuntu:16.04 

# constants
ENV NODE_VERSION 8.9.3 

# common packages
RUN apt-get update
RUN apt-get install -y curl

# graphic packages
RUN apt-get install -y imagemagick ghostscript poppler-utils

# node
RUN rm -f /usr/local/bin/node && \
    rm -f /usr/bin/node && \
    rm -f /usr/local/bin/npm && \
    rm -f /usr/bin/npm && \
    rm -fr /opt/node-* && \
    distro=node-v${NODE_VERSION}-linux-x64 && \
    distro_file=${distro}.tar.gz && \
    cd /opt && \
    curl -O http://nodejs.org/dist/v${NODE_VERSION}/$distro_file && \
    tar -zxvf $distro_file && \
    mkdir -p /usr/local/bin/ && \
    ln -s /opt/$distro/bin/node /usr/local/bin/node && \
    ln -s /opt/$distro/bin/npm /usr/local/bin/npm && \
    rm -fr /usr/local/lib/node_modules && \
    rm $distro_file && \
    npm config set prefix /usr/local

# pm2
RUN npm install pm2 -g
RUN pm2 update
VOLUME ["/app"]
EXPOSE 80 443 43554
WORKDIR /app
CMD ["pm2-docker", "start", "process.yml"]
