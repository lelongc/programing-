netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l

alias conn="netstat -plant | grep '80\|443' | grep -v LISTEN |
wc -l"

conn

<!-- Total connections on port 80 and 443:
12 -->

Making the change persisten-------------------------
nano ~/.bashrc
<!-- Go to the bottom and add the following: -->
Listing all of the available aliase--------------
alias 


This is one way of creating custom bash commands or bash aliases.
Of course, you could actually write a bash script and add the script
inside your /usr/bin folder, but this would not work if you don't have
root or sudo access, whereas with aliases you can do it without the
need of root access.
