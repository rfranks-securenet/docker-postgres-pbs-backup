FROM debian:bookworm

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
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]