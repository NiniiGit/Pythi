#!/bin/bash

Test="location1"

xml_new="location2"
#(okay for cleanup except last one month)

Log_location_DCIPC="location3"
# (delete files but not directroies except last one month)

Log_location_ADPRNG01="location4"
# (older than month)

wasext_backup_location="location5"
#(remove except last one backup)
latest_backup=`ls -t1 $wasext_backup_location |  head -n 1`

rm currentspace_used_byFolders.txt space_tobe_reclaimed.txt files_tobe_removed.txt newspace_used_byFolders.txt

if [ -d "$xml_new" ];
then
        echo "xml_new directory does exist"
        du -sh $xml_new > currentspace_used_byFolders.txt
        find $xml_new -mtime +30 | du -sh > space_tobe_reclaimed.txt
        find $xml_new -mtime +30 -type f > files_tobe_removed.txt
        echo "files from $xml_new  older than month will be removed"
        find $xml_new -mtime +30 -type f -exec rm -f {} \;
        du -sh $xml_new > newspace_used_byFolders.txt
else
        echo "xml_new directory does not exist"
fi


if [ -d "$Log_location_DCIPC" ];
then
        echo "Log_location_DCIPC directory does exist"
        du -sh $Log_location_DCIPC >> currentspace_used_byFolders.txt
        find $Log_location_DCIPC -mtime +30 | du -sh >> space_tobe_reclaimed.txt
        echo "Files from $Log_location_DCIPC start from here" >> files_tobe_removed.txt
        find $Log_location_DCIPC -mtime +30 -type f >> files_tobe_removed.txt
        echo "files from $Log_location_DCIP older than month will be removed"
        find $Log_location_DCIP -mtime +30 -type f -exec rm -f {} \;
        du -sh $Log_location_DCIP >> newspace_used_byFolders.txt
else
        echo "Log_location_DCIPC directory does not exist"
fi



if [ -d "$Log_location_ADPRNG01" ];
then
        echo "Log_location_ADPRNG01 directory does exist"
        du -sh $Log_location_ADPRNG01 >> currentspace_used_byFolders.txt
        find $Log_location_ADPRNG01 -mtime +30 | du -sh >> space_tobe_reclaimed.txt
        echo "Files from $Log_location_ADPRNG01 start from here" >> files_tobe_removed.txt
               find $Log_location_ADPRNG01 -mtime +30 -type f >> files_tobe_removed.txt
               echo "files from $Log_location_ADPRNG01 older than month will be removed"
               find $Log_location_ADPRNG01 -mtime +30 -type f -exec rm -f {} \;
               du -sh $Log_location_ADPRNG01 >> newspace_used_byFolders.txt
       else
               echo "Log_location_ADPRNG01 directory does not exist"
       fi


       if [ -d "$wasext_backup_location" ];
       then
               echo "wasext_backup_location directory does exist"
               du -sh $wasext_backup_location >> currentspace_used_byFolders.txt
               find $wasext_backup_location -type f -not -name $latest_backup|du -sh >> space_tobe_reclaimed.txt
               echo "Files from $wasext_backup_location start from here" >> files_tobe_removed.txt
               find $wasext_backup_location -type f -not -name $latest_backup >> files_tobe_removed.txt
               echo "files from $wasext_backup_location older than month will be removed"
               find $wasext_backup_location -type f -not -name $latest_backup -exec rm -f {} \;
               du -sh $wasext_backup_location >> newspace_used_byFolders.txt

       #       find $xml_new -mtime +30 > wasext_backup_location.txt
       else
               echo "wasext_backup_location directory does not exist"
       fi
