#!/bin/bash

# mx.sh: Make eXecutable

SCRIPT=$1

printf  "#!/bin/bash\n\n\n" >> $SCRIPT

chmod +x $SCRIPT

# open vim in insert mode at end of file
vim "+normal G$" +startinsert $SCRIPT