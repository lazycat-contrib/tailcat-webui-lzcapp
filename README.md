# Tailcat WebUI for LazyCat

LazyCat LPK v2 packaging for [Tailcat WebUI](https://github.com/ca-x/tailcat-webui), a multi-user Tailcat control plane and responsive web console.

The package persists SQLite and runtime data under `/lzcapp/var`, connects the application to LazyCat OIDC at `/api/v1/auth/callback`, and assigns a separate `publish` secondary domain to public resources. Supported network and transfer limits are available in the setup wizard. The upstream Docker command does not define a healthcheck, so this package intentionally does not invent one.

## Build

```sh
lzc-cli project release -o dist/application.lpk
```

## GitHub Actions secrets

- `LZC_API_TOKEN`: LazyCat PAT used for image delivery and official publishing
- `LZC_API_HOST`: optional PAT API host override
- `APPSTORE_URL`: private store URL
- `APPSTORE_TOKEN`: private store token
- `APP_ID`: optional existing private-store application ID
- `PRIVATE_STORE_GROUP_CODES`: optional private-store group codes

The scheduled workflow discovers stable SemVer image tags, copies the selected `linux/amd64` image to the LazyCat registry, creates a versioned GitHub Release asset, and reconciles the official and private stores independently.
