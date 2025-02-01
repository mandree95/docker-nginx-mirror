# Dockerfile for Nginx Mirror

This Dockerfile builds a Docker image that serves as a mirror for a specified website. It uses the `nginx:alpine` base image and copies the mirrored website from a separate multi-stage Docker image built using the `ubuntu:latest` base image.

## Usage

To use this Docker image, you need to build it using the following command:

```bash
docker build -t nginx-mirror --build-arg MIRROR_BASE_URL=<mirror_base_url> --build-arg MIRROR_HOSTNAME=<mirror_hostname> .
```

Replace `<mirror_base_url>` with the base URL of the website you want to mirror, and `<mirror_hostname>` with the hostname of the website you want to mirror.

Once the Docker image is built, you can run it using the following command:

```bash
docker run -p 80:80 nginx-mirror
```

This will start an Nginx server that serves the mirrored website on port 80.

## Configuration

The Dockerfile uses two build arguments:

- `MIRROR_BASE_URL`: The base URL of the website you want to mirror. This should include the protocol (http:// or https://) and the domain name.
- `MIRROR_HOSTNAME`: The hostname of the website you want to mirror. This should be the part of the URL after the domain name.

You can customize these build arguments when building the Docker image.

## License

This Dockerfile is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

