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


        print(res.status_code)

        current_status = res.json()

#print("Current replication status of this database " + DBNAME + " is:" +  current_status["replicationStatus"])

        if res.status_code != 200 :

                print("This database " + word + " is seems to be removed now by  EDA-DBGATE-DROPDB-RESOLUTIION.py, as status code is not 200 for GET operation ..." )


        else:
                print("Currently this database " + word + " is giving 200 as a status code,so seems its not been removed from DBGATE. Please check output of python script EDA-DBGATE-DROPDB-RESOLUTIION.py..." )
        print("#############################################################################################################################")
