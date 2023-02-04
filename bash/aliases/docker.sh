### DOCKER ###
alias .docker.container.ps='docker container ps'

alias .docker.prune.all='docker system prune -a'


#usage .docker.tags.show-available "microsoft/nanoserver" "microsoft/dotnet" "library/mongo" "library/redis"
.docker.tags.show-available() {
    arr=("$@")

    for item in "${arr[@]}";
    do
        tokenUri="https://auth.docker.io/token"
        data=("service=registry.docker.io" "scope=repository:$item:pull")
        token="$(curl --silent --get --data-urlencode ${data[0]} --data-urlencode ${data[1]} $tokenUri | jq --raw-output '.token')"
        listUri="https://registry-1.docker.io/v2/$item/tags/list"
        authz="Authorization: Bearer $token"
        result="$(curl --silent --get -H "Accept: application/json" -H "Authorization: Bearer $token" $listUri | jq --raw-output '.')"
        echo $result
	echo "test"
	result=$(curl --silent --get -H "Accept: application/json" -H "Authorization: Bearer $token" "https://registry-1.docker.io/v2/mailu/clamav/manifests/" \
       	| grep -i '[Dd]ocker-[Cc]ontent-[Dd]igest:' \
    |sed 's/[Dd]ocker-[Cc]ontent-[Dd]igest: *\(sha256:[a-zA-Z0-9]*\)/\1/' |tr -d '\r\n')
        echo $result

done
}

alias .docker.logs='docker logs'

.docker.run () {

    if [ -z "$1" ]
    then
        echo "USAGE: .docker.run IMAGENAME CONTAINERNAME"
    return 1
    fi

 IMAGE=$1
 NAME=$2

     if [ -z "$NAME" ]
     then
           NAME=$(echo $1 | sed 's/[^a-zA-Z0-9]//g')
     fi


  docker run --name $NAME $IMAGE
}
.docker.run.ant.build () {
  docker run  --mount type=bind,source="$(pwd)",target=/build/  paulushc/apacheant ant -buildfile /build/
}



.docker.exec.bin.bash () {
   docker exec -it $1 /bin/bash
}

.docker.exec.bash () {
   docker exec -it $1 /bash
}

.docker.exec.bin.sh () {
   docker exec -it $1 /bin.sh
}
