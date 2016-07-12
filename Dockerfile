FROM node:argon

RUN echo "Europe/Amsterdam" > /etc/timezone

COPY . /app

RUN cd /app && npm install --production

WORKDIR /app

CMD ["/usr/local/bin/node", "app.js"]