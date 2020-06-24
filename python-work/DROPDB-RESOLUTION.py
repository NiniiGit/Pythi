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


        mongo_id = res.json()

        print("Mongo id of this database " + word + " is:" +  mongo_id["id"])


        current_status = res.json()

        if current_status["replicationStatus"] != 'RUNNING' :

                print("Now using Mongo id will proceed for requesting deletion of this db from DBgate")
                #res = requests.delete('http://dbgate-api.' + ENVIRONMENT + '.emea.caas.oneadp.com/api/v1/databases/delete/' + mongo_id["id"] )
                print("DELETE request has been initiated for this DB: " + word )
        else:
                print("Seems DB is already up and running in DBgate, hence no deletion will be perfomed..")



        print("#############################################################################################################################")
