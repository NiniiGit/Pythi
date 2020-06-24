#!/usr/bin/python

import requests
import sys
import re
import json
from datetime import datetime, timedelta



Env=(sys.argv[1])

print(Env)

#print("#############################################################################################################################")

DBNAME=(sys.argv[2])

print(DBNAME)


set_date = datetime.strptime(sys.argv[3], '%d/%m/%Y')

#date_time_obj = datetime.datetime.strptime(date_time_str, '%Y-%m-%d %H:%M:%S.%f')

print(set_date)

now = datetime.now()


string = "staging"

string1 ="dev"

if Env in ( string.split()) :
        ENVIRONMENT = 'stg'
        print("Environment name is " + ENVIRONMENT)
#  print("This is UAT environment so value of ENVIRONMENT is " + ENVIRONMENT)

elif Env in ( "dev" ) :
        ENVIRONMENT = 'dev'
        print("Environment name is " + ENVIRONMENT)

elif Env in ( "production" ) :
        ENVIRONMENT = 'prd'
        print("Environment name is " + ENVIRONMENT)


elif Env in ( "FIT" ) :
        ENVIRONMENT = 'fit'
        print("Environment name is " + ENVIRONMENT)
else:
        print("DB is not present in DBGATE it seems")



print("#############################################################################################################################")

for word in DBNAME.split():

            # displaying the words
        print("the DBNAME is " + word)


        print("Now GET action will be performed to find out information of the database")

        res = requests.get('http://xxxx' + ENVIRONMENT + 'xxxxxx' + Env + '/database/' + word )


        current_status = res.json()


        print("Current replication status of this database " + word + " is:" +  current_status["replicationStatus"])

        if current_status["replicationStatus"] == 'RUNNING' :

                print("Current replication status of this database " + word + " is:" +  current_status["replicationStatus"] +" ,so now will not perform any action ahead and exiting now..." )

#       exit()

        elif now-timedelta(days=2) >= set_date :

                print("Current replication status of this database " + word + " is:" +  current_status["replicationStatus"] +" ,and also the date of the issue is older than today's date;so  now please perform action to DELETE this DB ahead using other python script EDA-DBGATE-DROPDB-RESOLUTIION.py...")


        else:

                print("Seems either current replication status is RUNNING else date of incident occurence is just not older than 2 days, so no EDA action will be performed..." )

        print("#############################################################################################################################")

for s in DBNAME.split():
        Positions = DBNAME.split().index(s)+1
