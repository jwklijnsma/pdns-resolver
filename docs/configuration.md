# Configuration

The image copies [`recursor.conf`](https://github.com/jwklijnsma/pdns-resolver/blob/main/recursor.conf)
to `/etc/powerdns/` and starts `pdns_recursor --config-dir=/etc/powerdns`.

| Setting | Value | Meaning |
|---|---|---|
| `local-address` / `local-port` | `0.0.0.0` / `5253` | Listen on all addresses, port 5253 |
| `allow-from` | `0.0.0.0/0, ::1/128, fc00::/7, fe80::/10` | Who may query |
| `max-cache-entries` | `1000000` | Record cache size |
| `max-cache-ttl` | `86400` | Cap TTLs at 24 hours |
| `max-negative-ttl` | `3600` | Cache NXDOMAIN for at most 1 hour |
| `max-mthreads` | `2048` | Concurrent queries per thread |
| `hint-file` | `/usr/share/dns/root.hints` | Root servers |
| `include-dir` | `/etc/powerdns/recursor.d` | Extra settings, loaded after `recursor.conf` |
| `lua-config-file` | `/etc/powerdns/recursor.lua` | Lua config (trust anchors, RPZ, …) |
| `webserver` | `no` | No built-in web server / API |
| `quiet` | `yes` | Don't log every query |

## Override settings

Mount a folder with extra `.conf` files at `/etc/powerdns/recursor.d`; they are read after
the main file, so a setting there wins:

```bash
docker run -d -p 5253:5253/udp -p 5253:5253/tcp \
  -v ./recursor.d:/etc/powerdns/recursor.d:ro \
  ghcr.io/jwklijnsma/pdns-resolver:main
```

## Restrict who may query

`recursor.d/allow.conf`:

```ini
allow-from=127.0.0.0/8, 10.0.0.0/8, 192.168.0.0/16, ::1/128
```

## Forward a zone

`recursor.d/forward.conf`, e.g. to send a local zone to your authoritative server:

```ini
forward-zones=home.example.org=10.0.3.100;10.0.3.101
```
