#!/bin/bash
echo "Welcome To Shell Files"

timestamp=$(date +%Y%m%d_%H%M%S)
log_path="`pwd`"
filename=docker_cleanup.log
log=./$filename


docker_find (){
echo "#####################################################################" >> $log
echo "Finding images" >> $log
echo "#####################################################################" >> $log
REMOVEIMAGES=`docker images | grep "none" | awk '{print $3}'`
echo "Listing images that needs to be cleaned up" >> $log
echo $REMOVEIMAGES >>$log
}


docker_cleanup(){
echo "#####################################################################" >> $log
echo "Cleaning images" >> $log
echo "#####################################################################" >> $log
docker rmi ${REMOVEIMAGES}
}

docker_find
docker_cleanup