#!/bin/bash
for server in $(cat servers.txt) ; do ssh lab@${server} 'bash -s' < ./text.sh ; done
