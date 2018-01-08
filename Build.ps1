& ".\SetEnvVar.ps1"


#Setup Network for project Stack
$internalNetwork = docker network inspect "$env:InternalNetworkName"

if ($internalNetwork.count -le 1) {
	docker network create -d nat $env:InternalNetworkName 
}

#Destry the existed containers
docker-compose down --rmi all

#Rebuild the images
docker-compose build

#Start Docker Registry Container if not already running
$Registry = docker inspect $env:DockerRegistryImageName
if ($Registry.count -le 1){
	docker-compose -f ".\Registry\docker-registry.yml" up -d 
}



#Publish images to DockerRegistry
if (-not ([string]::IsNullOrEmpty($env:DockerRegistry))) {
	$PublishSQLInstanceName = "$env:DockerRegistry/$env:SQLInstanceName`:$env:Version"
	$PublishWebUIImage = "$env:DockerRegistry/$env:WebUIImageName`:$env:Version"
	$PublishApiImageName = "$env:DockerRegistry/$env:ApiImageName`:$env:Version"
	$PublishDatabaseImageName = "$env:DockerRegistry/$env:DatabaseImageName`:$env:Version"

	#Tag iamges
	Write-Host "`n`n"
	Write-Host "Taging Images"
	Write-Host "---> Taging $env:SQLInstanceName to $PublishSQLInstanceName"
	docker tag $env:SQLInstanceName $PublishSQLInstanceName
	Write-Host "---> Taging $env:WebUIImageName to $PublishWebUIImage"
	docker tag $env:WebUIImageName $PublishWebUIImage
	Write-Host "---> Taging $env:ApiImageName to $PublishApiImageName"
	docker tag $env:ApiImageName $PublishApiImageName
	Write-Host "---> Taging $env:DatabaseImageName to $PublishDatabaseImageName"
	docker tag $env:DatabaseImageName $PublishDatabaseImageName
	Write-Host "for DockerRegistry[$env:DockerRegistry]"
	Write-Host "`n`n"


	#Push Tag images to Registry
	Write-Host "`n`n"
	Write-Host "Pushing Images"
	Write-Host "---> $PublishSQLInstanceName"
	Write-Host "---> $PublishWebUIImage"
	Write-Host "---> $PublishApiImageName"
	Write-Host "---> $PublishDatabaseImageName"
	Write-Host "to DockerRegistry[$env:DockerRegistry]"
	Write-Host "`n`n"
	docker push $PublishSQLInstanceName
	docker push $PublishWebUIImage
	docker push $PublishApiImageName
	docker push $PublishDatabaseImageName
}

# Remove local images
#docker rmi $env:WebUIImageName 
#docker rmi $env:ApiImageName
#docker rmi $env:DatabaseImageName

#docker rmi $PublishWebUIImage
#docker rmi $PublishApiImageName
#docker rmi $PublishDatabaseImageName




	