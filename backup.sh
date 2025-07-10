#!/bin/bash

FILEID=${PGHOST}_${PGDATABASE}_$(date -I)
mkdir /pg-backup

pg_dump | gzip > /pg-backup/${FILEID}.sql.gz

proxmox-backup-client backup ${FILEID}.pxar:/pg-backup