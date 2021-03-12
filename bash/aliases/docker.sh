### DOCKER ###
alias .docker.container.ps='docker container ps'



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
