#!/bin/bash
echo "Welcome To Shell Files"

timestamp=$(date)
log_path="`pwd`"
filename=docker_cleanup.log
log=./$filename


docker_find (){
echo "----------------------------------------" >> $log
echo "$timestamp - Finding images" >> $log
echo "----------------------------------------" >> $log
REMOVEIMAGES=`docker images | grep "none" | awk '{print $3}'`
echo "$timestamp - Listing images that needs to be cleaned up " >> $log
echo $REMOVEIMAGES >>$log
}


docker_cleanup(){
echo "----------------------------------------" >> $log
echo "$timestamp - Cleaning images " >> $log
echo "---------------------------------------" >> $log
docker rmi ${REMOVEIMAGES}
echo "$timestamp - $?" >> $log
}

docker_find
docker_cleanup
