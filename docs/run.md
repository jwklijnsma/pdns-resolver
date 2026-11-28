# Run it

```bash
docker run -d --name pdns-resolver --restart unless-stopped \
  -p 5253:5253/udp -p 5253:5253/tcp \
  ghcr.io/jwklijnsma/pdns-resolver:main
```

Test it:

```bash
dig @127.0.0.1 -p 5253 example.org A
```

## Docker Compose

```yaml
services:
  pdns-resolver:
    image: ghcr.io/jwklijnsma/pdns-resolver:main
    restart: unless-stopped
    ports:
      - "5253:5253/udp"
      - "5253:5253/tcp"
```

## Serve port 53

The recursor listens on 5253 inside the container. To answer normal DNS on port 53, map it:
`-p 53:5253/udp -p 53:5253/tcp` (stop `systemd-resolved`'s stub listener first if it holds
port 53 on the host).

!!! warning "Open resolver"
    `allow-from` is `0.0.0.0/0`, so the recursor answers anyone who can reach it. Only publish
    the port on a trusted network, or [restrict it](configuration.md#restrict-who-may-query).
