# Image and updates

`.github/workflows/docker-publish.yml` builds the image and pushes it to
`ghcr.io/jwklijnsma/pdns-resolver`:

| When | Tags |
|---|---|
| Push to `main` | `main` |
| You push a tag `vX.Y.Z` | `vX.Y.Z` |
| Every night (03:30 UTC) | `nightly`, rebuilt with the latest Ubuntu and `pdns-recursor` updates |
| Pull request | built, not pushed |

Pushed images are signed with [cosign](https://github.com/sigstore/cosign) (keyless).
Verify:

```bash
cosign verify ghcr.io/jwklijnsma/pdns-resolver:main \
  --certificate-identity-regexp 'https://github.com/jwklijnsma/pdns-resolver/' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com
```

Releases: **Actions › release › Run workflow** makes the tag and the GitHub release with
notes. A tag made by a workflow doesn't start other workflows, so for a versioned image push
the tag yourself (`git tag v1.2.3 && git push origin v1.2.3`) instead.
