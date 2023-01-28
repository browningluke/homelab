FROM caddy:2.2.1-builder-alpine AS builder

RUN xcaddy build \
	--with github.com/greenpau/caddy-auth-portal@v1.2.20 \
	--with github.com/greenpau/caddy-auth-jwt@v1.1.10

FROM caddy:2.2.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#COPY /root/ /
