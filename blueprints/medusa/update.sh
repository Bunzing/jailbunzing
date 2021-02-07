#!/usr/local/bin/bash
# This file contains the update script for radarr

iocage exec "$1" service medusa stop
#TODO insert code to update radarr itself here
iocage exec "$1" chown -R medusa:medusa /usr/local/share/medusa /config
# shellcheck disable=SC2154
cp "${SCRIPT_DIR}"/blueprints/radarr/includes/radarr.rc /mnt/"${global_dataset_iocage}"/jails/"$1"/root/usr/local/etc/rc.d/radarr
iocage exec "$1" chmod u+x /usr/local/etc/rc.d/medusa
iocage exec "$1" service medusa restart