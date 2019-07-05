#!/bin/sh

# The following comment lines are used by the init setup script like the
# chkconfig command for RedHat based distributions. Change as
# appropriate for your installation.

### BEGIN INIT INFO
# Provides:          nexus-iq-server
# Required-Start:    $local_fs $remote_fs $network $time $named
# Required-Stop:     $local_fs $remote_fs $network $time $named
# Default-Start:     3 5
# Default-Stop:      0 1 2 6
# Short-Description: nexus-iq-server service
# Description:       Start the nexus-iq-server service
### END INIT INFO

NEXUS_IQ_SERVER_HOME=/opt/nxiq
VERSION=1.12.0
JAVA_OPTIONS="-Xmx1024m -XX:MaxPermSize=128m"
# The user ID which should be used to run the IQ Server
# # IMPORTANT - Make sure that the user has the required privileges to write into the IQ Server work directory.
RUN_AS_USER=sotudeko

do_start()
{
    cd $NEXUS_IQ_SERVER_HOME
    #su -m $RUN_AS_USER -c "java $JAVA_OPTIONS -jar nexus-iq-server-$VERSION.jar server  config.yml > /dev/null 2>&1 &"
    java $JAVA_OPTIONS -jar nexus-iq-server server config.yml > /dev/null 2>&1 &
    echo "Starting nexus-iq-server on http://localhost:8070"
}

do_console()
{
    cd $NEXUS_IQ_SERVER_HOME
    #java $JAVA_OPTIONS -jar nexus-iq-server-$VERSION.jar server config.yml
    java $JAVA_OPTIONS -jar nexus-iq-server server config.yml
}

do_stop()
{
    pid=`ps aux | grep nexus-iq-server | grep -vE '(stop|grep)' | awk '{print $2}'`
    kill $pid
    echo "Killed nexus-iq-server - PID $pid"
}

do_usage()
{
    echo "Usage: nexus-iq-server [console|start|stop]"
}

case $1 in
console) do_console
;;
start) do_start
;;
stop) do_stop
;;
*) do_usage
;;
esac

