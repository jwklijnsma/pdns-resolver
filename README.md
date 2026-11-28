# pdns-resolver

A PowerDNS Recursor container image (Ubuntu 24.04) listening on port 5253, rebuilt every night.

```bash
docker run -d -p 5253:5253/udp -p 5253:5253/tcp ghcr.io/jwklijnsma/pdns-resolver:main
dig @127.0.0.1 -p 5253 example.org
```

Documentation: <https://jwklijnsma.github.io/pdns-resolver/>
