FROM docker.viriciti.com/modules:master-5

COPY . /app

RUN ln -s /modules/node_modules /app/node_modules

WORKDIR /app
CMD ["/usr/local/bin/node", "app.js"]