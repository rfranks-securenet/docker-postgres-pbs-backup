#!/bin/bash

FILEID=${PGHOST}_${PGDATABASE}
mkdir /pg-backup

pg_dump | gzip > /pg-backup/${FILEID}.sql.gz

proxmox-backup-client backup --backup-id ${FILEID} ${PBSARGS} ${FILEID}.pxar:/pg-backup