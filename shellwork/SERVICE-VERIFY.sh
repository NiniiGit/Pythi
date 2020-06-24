#!/bin/bash

 echo "exit"|curl "http://{{host_target}}.<fullname>:<port>/alfresco/"|grep -i "Welcome to Alfresco" > /dev/null



 if [ $? -eq 0 ]
 then

        echo -e "Alfresco  is successfully accessible after restart"
 else

       echo -e "Alfresco  is still not accessible after restart"

 fi
