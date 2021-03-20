#!/bin/sh
#
# Minio S3

prog_dir=`dirname \`realpath $0\``

name="minio"
version="18"
logfile="/tmp/DroboApps/${name}/minio.log"
pidfile="/tmp/DroboApps/${name}/pid.txt"


miniostorage="/mnt/DroboFS/Shares/Public/MinioS3/"


# args: $1 = pidfile
# return: $? = 0 if running, 1 if not
_is_running() {
  /bin/ps | /bin/grep minio &> /dev/null
}

_mount_tmp() {
  grep -q ^tmpfs /proc/mounts 2> /dev/null
  if [ $? -ne 0 ]; then
    mount -t tmpfs tmpfs /tmp 1> /dev/null 2>&1
  fi
  mkdir -p `dirname ${pidfile}` 1> /dev/null 2>&1
}







start_service() {
  #_mount_tmp
  #"${prog_dir}/sbin/minio" server ${miniostorage} -C ${prog_dir}/etc/ --quiet 1>> ${logfile} 2>&1
  "${prog_dir}/sbin/minio" server ${miniostorage} -C ${prog_dir}/etc/ --quiet &
}

stop_service() {
  /usr/bin/killall minio
}

status() {
  /bin/cat ${prog_dir}minio.log
}


case "$1" in
  start)
    start_service
    ;;
  stop)
    stop_service
    ;;
  restart)
    stop_service
    start_service
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 [start|stop|restart|status]"
    exit 1
    ;;
esac
