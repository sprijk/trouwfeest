FROM docker.viriciti.com/trouwfeest-modules:1

COPY . /app

WORKDIR /app

CMD ["/usr/local/bin/node", "app.js"]