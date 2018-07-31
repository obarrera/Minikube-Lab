FROM debian:8

# initial setup
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed curl

# add the signal sciences repo to our apt sources
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update
RUN echo "deb https://apt.signalsciences.net/nginx/mainline jessie main" > /etc/apt/sources.list.d/sigsci-nginx.list
RUN apt-get update
RUN apt-get -y install nginx


# install and configure the sigsci agent
RUN apt-get -y install sigsci-agent
# install the sigsci module
RUN apt-get -y install sigsci-module-nginx

RUN  mkdir /app && mkdir /etc/sigsci && mkdir /etc/nginx/sites-enabled
COPY app/nginx.conf /etc/nginx/nginx.conf
COPY app/default.conf /etc/nginx/sites-enabled/default.conf
COPY app/index.html /usr/share/nginx/html/index.html
COPY app/app.js /usr/share/nginx/html/app.js
COPY app/agent.conf /etc/sigsci/agent.conf
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
