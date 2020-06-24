#Script to call your  applicative router fix script

import re
import sys
import subprocess
import time

start_router=subprocess.call(['<script to start your service>'])

print(start_router)

print("Going to sleep for 5 sec")
time.sleep(5)
print("sleep of 5 seconds completed")

current_state=subprocess.check_output(['<sccript to check status of service>'])

ideal_state='Service is RUNNING'


if re.search(ideal_state,current_state):
    print (ideal_state)
    sys.exit(0)
else:
    print (current_state)
    sys.exit(2)
