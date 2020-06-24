#This script will help us to check status of router

import re
import sys
import subprocess
Result=subprocess.check_output(['<your_shell_script>'])

ideal_state='Service is RUNNING'

if re.search(ideal_state,Result):
    print (ideal_state)
    sys.exit(0)

else:
    print ('Seems Service is not running')
    sys.exit(2)
