# git-client-docker
Based off of http://jonnyzzz.com/blog/2015/11/24/DockerGit/
Some notes pulled from https://tecadmin.net/install-git-1-9-on-centos-rhel/#

Be sure to alias your git command to run the docker
alias git='docker run -v `pwd`:`pwd` -w `pwd` --rm -it git_client:20170522-185957 /bin/bash /git-1.9.4.sh'
