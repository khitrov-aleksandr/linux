#!/bin/bash

CONTAINERS=(
puppet
elastic
infr-b
ansible
postlog
)

REPOSITORY="backup"
BACKUP_DIR="/storage/backup/docker"

get_timestamp() {
        date +"%H:%M:%S %d.%m.%Y"
}

for X in ${CONTAINERS[@]}; do

        echo $(get_timestamp) "Commit container $X tobackup image"
        docker commit -p $X $REPOSITORY:$X > $BACKUP_DIR/$X.tar

        echo $(get_timestamp) "Save backup image to tar-file"
        docker save -o $BACKUP_DIR/$X.tar $REPOSITORY:$X

        echo $(get_timestamp) "Remove backup image"
        docker rmi $REPOSITORY:$X
done

exit 0
