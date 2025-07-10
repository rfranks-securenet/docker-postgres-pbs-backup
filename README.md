# Postgres PBS Backup

This docker image backs up a postgresql database to proxmox backup server.

It takes the following environment variables:

`PGHOST`
`PGDATABASE`
`PGUSER`
`PGPASSWORD`

`PBS_REPOSITORY`
`PBS_PASSWORD`

To inject a custom root CA certificate, place a .crt file within the `cacerts/` folder
and build the image.