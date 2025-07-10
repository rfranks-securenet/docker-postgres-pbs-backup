#!/bin/bash

mkdir /pg-backup

pg_dump | gzip > /pg-backup/${PGDATABASE}.sql.gz

proxmox-backup-client backup --backup-id ${PGHOST}-${PGDATABASE} ${PBSARGS} ${PGDATABASE}.pxar:/pg-backup