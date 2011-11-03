#!/bin/bash

export PATH=`rospack find openrtm`/bin:$PATH
export PYTHONPATH=`rospack find openrtm`/lib/python2.6/site-packages:$PYTHONPATH
. `rospack find openrtm`/share/rtshell/bash_completion
. `rospack find openrtm`/share/rtshell/shell_support

export RTCTREE_NAMESERVERS=localhost
echo ";; set RTCTREE_NAMESERVERS=$RTCTREE_NAMESERVERS"