#/bin/bash

adp_home="home_location"
softs_home="soft_installation_location"
adp_api_folder="$softs_home/api"
alfresco_home="$softs_home/alfresco"

#function for stopping alfresco

# stopalfresco()
# {
        if [ -d "$alfresco_home" ];
        then
            echo "${cgreen}Alfresco${chardef} - Killing Application"
            pid_alfresco=`ps -eaf | grep -i alfresco  | grep -v grep | awk -F " " '{print $2}'`
            for palfresco in $pid_alfresco
                        do
                          trap "kill $palfresco" SIGINT
                          fuser -k 8080/tcp
                        done
        else
            echo "${cred}Alfresco${chardef} - No Alfresco on this servers"
        fi
# }

#function for starting alfresco
     echo "sleeping for 10 seconds"
     sleep 10

    echo "sleep completed, so now will start alfresco"
# startalfresco()
# {

        if [ ! -d "$alfresco_home" ];
        then
            echo "${cred}Alfresco has not been deployed on this server - Startup/Shutdown bypassed${chardef}"
        else
                #ALFRESCO
                #pid_alfresco=`ps -eaf | grep -i alfresco  | grep -v grep | awk -F " " '{print $2}'`
                #if [ "${pid_alfresco}" == "" ];
                #then
                                echo "${cred}Starting Alfresco...${chardef}"
                        currentpath=`pwd`
                        cd $alfresco_home

                        runfile=`find $alfresco_home/* -name alfresco.sh`
                        runlogs=`find $alfresco_home/* -name alfresco.log`

                        timer=`date +"%m%d.%H%M"`
                        mv $runlogs "$runlogs$timer"
                        touch $runlogs
                        nohup $runfile start
                        i=1
                        loop="true"
                        while [ $loop == "true" ]
                        do
                                sleep 10s
                                checker=`grep -R "Preauthorized user: admin" $runlogs`
                                if [ -z $checker ]
                                then
                                        echo "${ccyan}Starting of Alfresco is ${chardef} ${cred}ONGOING....${chardef}"
                                        tail -2 $runlogs
                                else
                                        loop="false"
                                        echo -e "${ccyan}\t Alfresco ${chardef} =>\tstatus:${cgreen}Service UP${chardef}"
                                fi

                                if [ $i == 1000 ]
                                then
                                        echo "Exceed time for Startup... Please check manualy"
                                        loop="false"
                                fi
                                i=$(expr $i + 1)
                        done

                        cd $currentpath

                #else
                        #        echo -e "${ccyan}\t Alfresco ${chardef} =>\tstatus:${cgreen}Service UP${chardef}\tPID:${cgreen}${pid_alfresco}${chardef}\tPort:${cgreen}8080${chardef}"


         fi
# }
