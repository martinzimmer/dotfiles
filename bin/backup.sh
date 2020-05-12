#!/bin/bash

TEXTFILE_COLLECTOR_DIR=/var/lib/node_exporter/
LAST_BACKUP_DIR=/data/backup/mongodb/default/latest/

# Note the start time of the script.
START="$(date +%s)"

/usr/bin/mongodb-consistent-backup "$@"
EXIT_CODE=$?

if [ ${EXIT_CODE} -ne 0 ]; then
    LAST_BACKUP_SIZE=0
else
    LAST_BACKUP_SIZE=$(du -bs "${LAST_BACKUP_DIR}" | cut -f1)
fi

# Write out metrics to a temporary file.
END="$(date +%s)"

cat << EOF > "${TEXTFILE_COLLECTOR_DIR}/mongodb-consistent-backup.prom.$$"
# HELP mongodb_consistent_backup_duration_seconds backup duration in seconds
# TYPE mongodb_consistent_backup_duration_seconds gauge
mongodb_consistent_backup_duration_seconds $((${END} - ${START}))

# HELP mongodb_consistent_backup_last_run_seconds timestamp of when the last backup job finished 
# TYPE mongodb_consistent_backup_last_run_seconds counter
mongodb_consistent_backup_last_run_seconds ${END}

# HELP mongodb_consistent_backup_bytes size of the compressed backup artifacts 
# TYPE mongodb_consistent_backup_bytes gauge
mongodb_consistent_backup_bytes ${LAST_BACKUP_SIZE}

# HELP mongodb_consistent_backup_exit_code exit code of the last backup job (0 = success)
# TYPE mongodb_consistent_backup_exit_code gauge
mongodb_consistent_backup_exit_code ${EXIT_CODE}
EOF

# Rename the temporary file atomically.
# This avoids the node exporter seeing half a file.
mv "${TEXTFILE_COLLECTOR_DIR}/mongodb-consistent-backup.prom.$$" \
  "${TEXTFILE_COLLECTOR_DIR}/mongodb-consistent-backup.prom"

exit ${EXIT_CODE}
