Docker With Varnish Optimized For WordPress
===========

Docker Varnish image with a WordPress-oriented VCL. The container renders the backend values into the VCL at startup and runs `varnishd` in the foreground, which makes it friendlier to container platforms and CI.

### Environment variables

The image supports these runtime variables:

```text
VARNISH_STORAGE=256m
VARNISH_BACKEND_HOST=172.17.42.1
VARNISH_BACKEND_PORT=80
VARNISH_PORT=6081
```

If you need deeper cache policy changes, edit `varnish.vcl`.

### Download

```bash
docker pull nidr0x/varnish-wordpress
```

### Build

```bash
docker build -t varnish-wordpress .
```

### Run

```bash
docker run --rm -p 6081:6081 \
  -e VARNISH_BACKEND_HOST=172.17.42.1 \
  -e VARNISH_BACKEND_PORT=80 \
  varnish-wordpress
```

### CI checks

GitHub Actions runs these checks on pushes and pull requests:

- `shellcheck` for `start.sh`
- `hadolint` for `Dockerfile`
- `docker build`
- VCL compilation inside the built image with `varnishd -C`
