Steps to Install docker, elastic search as a docker, and check the status of the elastic search

1. Make sure wherever the shell script(install.sh) going to run must have sudo/root access because the script will install docker, if it is not installed and if docker is installed, should have the access to run the container.

2. If port 9200,9300 is not free elastic-search docker container will not run. please make sure ports are free.

3. Once elastic-search docker is installed it will check the health of elastic-search it will print as OK then the elastic-search cluster is healthy if not it will print as FAIL.