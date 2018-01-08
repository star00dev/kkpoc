& ".\SetEnvVar.ps1"


if (-not ([string]::IsNullOrEmpty($env:DockerRegistry))){
	$env:WebUIImageName = "$env:DockerRegistry/$env:WebUIImageName"
	$env:ApiImageName = "$env:DockerRegistry/$env:ApiImageName"
	$env:DatabaseImageName = "$env:DockerRegistry/$env:DatabaseImageName"
	
}else {
	$env:WebUIImageName = "$env:WebUIImageName"
	$env:ApiImageName = "$env:ApiImageName"
	$env:DatabaseImageName = "$env:DatabaseImageName"
}



#Building image path with Docker Registry if provided
#if ([string]::IsNullOrEmpty($env:DockerRegistry)){
#	throw "Env Var [DockerRegistry] is not set."
#}

#Setup Network for project Stack
$internalNetwork = docker network inspect "$env:InternalNetworkName"
if ($internalNetwork.count -le 1) {
	docker network create -d nat $env:InternalNetworkName 
}


docker-compose down

#docker-compose pull

docker-compose up -d
