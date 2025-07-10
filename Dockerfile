FROM debian:bookworm

LABEL org.opencontainers.image.source=https://github.com/rfranks-securenet/docker-postgres-pbs-backup
LABEL org.opencontainers.image.description="Docker image to back up a postgresql database to proxmox backup server"
LABEL org.opencontainers.image.licenses=Apache-2.0

RUN apt-get update && apt-get install -y curl ca-certificates

COPY proxmox-release-bookworm.gpg /usr/share/keyrings/proxmox-release-bookworm.gpg
COPY apt.postgresql.org.gpg /usr/share/keyrings/apt.postgresql.org.gpg
COPY pbs-client.list /etc/apt/sources.list.d/
COPY postgresql.list /etc/apt/sources.list.d/

RUN apt-get update && apt-get install -y \
    postgresql-client \
    proxmox-backup-client \
 && rm -rf /var/lib/apt/lists/*

COPY cacerts/* /usr/local/share/ca-certificates/

RUN update-ca-certificates

COPY backup.sh /backup.sh

ENTRYPOINT ["/backup.sh"]