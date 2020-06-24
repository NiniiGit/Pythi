#!/bin/bash

alfrescoLogs="/ehc/fs1/softs/alfresco/tomcat/logs"
alfrescoFile="catalina"
alfrescoEXT="out"
date=`date "+%Y-%m-%d"`
parsing=`tail -1000 ${alfrescoLogs}/${alfrescoFile}.${alfrescoEXT} | grep 'OutOfMemoryError'`

#source /ehc/fs1/adp/tools/applis/init_DOCUMENTCLOUDSTG.sh

if [ "$parsing" == "" ]
then
        echo "Seems false Alert as no message:OutOfMemoryError\|Hazelcast could be found in catalina.out"
        cp ${alfrescoLogs}/${alfrescoFile}.${alfrescoEXT} /ehc/fs1/home/infog/deploy/EDA/DCLOUD-EDA-DOCCLOUD-ALFRESCO-PRE-VERIFY/${alfrescoFile}.${date}.log
else
        echo "Seems Alfresco service is corrupt as could see message:OutOfMemoryError\|Hazelcast in catalina.out"

        cp ${alfrescoLogs}/${alfrescoFile}.${alfrescoEXT} /ehc/fs1/home/infog/deploy/EDA/DCLOUD-EDA-DOCCLOUD-ALFRESCO-PRE-VERIFY/${alfrescoFile}.${date}.log

fi
