#!/bin/bash

rel_path=`dirname $0`
if [ ${rel_path:0:1} == "/" ]; then
  # Script was executed with a full path
  script_path=$rel_path
else
  # script was executed with a partial path
  script_path="$PWD/$rel_path"
fi
