FROM ubuntu:latest AS builder
ARG MIRROR_BASE_URL
ARG MIRROR_HOSTNAME
RUN apt-get update && apt-get install -y wget && \
  mkdir /hhg && \
  cd /hhg && \
  wget -mpEk "$MIRROR_BASE_URL" && \
  cd /hhg/$MIRROR_HOSTNAME && \
  tar --xform s:'^./':: -cf /mirror.tar ./

FROM nginx:alpine
COPY --from=builder /mirror.tar /tmp/
RUN tar xf /tmp/mirror.tar -C /usr/share/nginx/html/ && \
  rm /tmp/mirror.tar