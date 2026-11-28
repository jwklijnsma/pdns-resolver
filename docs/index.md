# pdns-resolver

**A PowerDNS Recursor container image**, built on Ubuntu 24.04 and published to
`ghcr.io/jwklijnsma/pdns-resolver`. It listens on port **5253** (TCP and UDP), so it can sit
behind an authoritative server or a DNS frontend on the same host.

<div class="grid cards" markdown>

-   :material-rocket-launch: **[Run it](run.md)**

    `docker run` or Compose, and a quick `dig` test.

-   :material-cog: **[Configuration](configuration.md)**

    What `recursor.conf` sets, and how to override it.

-   :material-docker: **[Image and updates](image.md)**

    Nightly rebuilds, signed with cosign.

</div>

## At a glance

| | |
|---|---|
| **Base** | `ubuntu:24.04` with the distribution's `pdns-recursor` package |
| **Port** | `5253/tcp` and `5253/udp` |
| **Cache** | Up to 1,000,000 entries, max TTL 24 h, negative TTL 1 h |
| **Runs as** | `pdns:pdns` (dropped from root by the recursor) |
| **Image** | `ghcr.io/jwklijnsma/pdns-resolver:main`, plus a `nightly` rebuild |
