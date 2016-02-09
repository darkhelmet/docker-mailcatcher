You probably want this: https://hub.docker.com/r/darkhelmetlive/mailcatcher/

And then to do something like with docker-compose

    nginx:
      image: jwilder/nginx-proxy
      ports:
        - "80:80"
      links:
        - app
        - mailcatcher
      volumes:
        - "/var/run/docker.sock:/tmp/docker.sock:ro"
    mailcatcher:
      image: darkhelmetlive/mailcatcher
      environment:
        VIRTUAL_HOST: mailcatcher.dev
    app:
      build: .
      links:
        - pg
        - mailcatcher
      environment:
        VIRTUAL_HOST: app.dev
