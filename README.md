Docker with Varnish optimized for WordPress
===========

Docker Varnish image with VCL optimized to use with WordPress. It uses Alpine Linux 3.8 as base.

### Varnish environment variables
You can use the following variables to configure Varnish:

```
	VARNISH_BACKEND_PORT 80
	VARNISH_BACKEND_IP 172.17.42.1
	VARNISH_PORT 80
```

If you want to customize more in depth, you should edit varnish.vcl with the values that you want.

### Downloading image from Docker Hub 
You can download the pre-built image from Docker Hub with the following command:

```
	$ docker pull nidr0x/varnish-wordpress
```

### Building
If you want to build the Docker image by yourself, you can do this by running the following command:

```
	$ cd docker-varnish-wordpress
	$ docker build -t varnish-wordpress .
```

### Starting container
Go ahead, babieca! 

```
	$ docker run -i -d -p 80 -e VARNISH_BACKEND_IP 172.17.42.1 nidr0x/varnish-wordpress
```
