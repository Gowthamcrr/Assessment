#!/bin/bash
installElasticSearch()
{
	if [ "$(docker ps -aq -f name=elastic-search)" ]; then
        read -r -p "ElasticSearch container is already in this docker.It will be stopped removed and updated. Press [Y/N] " response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
    if [ "$(docker ps -aq -f status=exited -f name=elastic-search)" ]; then
        docker rm elastic-search
    else
	    docker stop elastic-search
        docker rm elastic-search
    fi
    else
          echo "ElasticSearch is not installed and you decided to use existing container"
          exit 0
    fi
	fi

	if [ "$(sudo lsof -i:9200)" ]; then
    	echo 'Port 9200 in Use Kindly free up port 9200 for ElasticSearch'
    	exit 0
	fi

	if [ "$(sudo lsof -i:9300)" ]; then
    	echo 'Port 9300 in Use Kindly free up port 9300 for ElasticSearch'
    	exit 0
	fi

	docker run -d -it --name=elastic-search -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --restart always elasticsearch:6.5.1
	sleep 40s
}

healthCheck()
{
	output=$(curl -s localhost:9200/_cluster/health)
	status=`echo $output|cut -d, -f2|awk -F':' '{ print $2 }'`
 	status=$(echo "$status" | tr -d '"')
	status=$(echo "$status" | xargs)
	if [[ $status == "green" ]];
	then
		echo "Health of elastic search is OK"
	else
		echo "Health of elastic search is FAIL. Please Check"
	fi
}

if [[ $(which docker) && $(docker --version) ]]; then
    echo "Docker is already installed...No need to Install"
    installElasticSearch
    healthCheck
  else
    echo "Docker is not installed...Trying to Install"
    sudo apt-get update
	sudo apt install -y docker.io
    sleep 30s
    installElasticSearch
    healthCheck    
fi
