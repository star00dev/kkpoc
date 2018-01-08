if ($OctopusParameters -eq $null)
{
	$OctopusParameters = @{
		version= "1.0.1"
		DockerRegistry = "172.16.110.115:5000"
		SQLInstanceName = "sqlserver";
		InterNetworkname = "web3tiers_network"
		DockerRegistryImageName = "web3tiers-registry"
		WebUIImageName = "web3tiers-ui"
		ApiImageName = "web3tiers-api"
		DatabaseImageName = "web3tiers-db"
		MessageConnectionString = "data source=172.16.110.26;initial catalog=Message;user id=sa;password=Admin123;MultipleActiveResultSets=True;App=EntityFramework"
	};
}


#Prepare env vars for docker-compose 
# clean up env var for all scope for Application variables

[Environment]::SetEnvironmentVariable("MessageConnectionString", "", "Process");
[Environment]::SetEnvironmentVariable("MessageConnectionString", "", "User");
[Environment]::SetEnvironmentVariable("MessageConnectionString", "", "Machine");


# set system env var
[Environment]::SetEnvironmentVariable("MessageConnectionString", $OctopusParameters["MessageConnectionString"], "Machine");
[Environment]::SetEnvironmentVariable("DockerRegistry", $OctopusParameters["DockerRegistry"], "Machine");
[Environment]::SetEnvironmentVariable("SQLInstanceName", $OctopusParameters["SQLInstanceName"], "Machine");
[Environment]::SetEnvironmentVariable("InterNetworkname", $OctopusParameters["InterNetworkname"], "Machine");
[Environment]::SetEnvironmentVariable("DockerRegistryImageName", $OctopusParameters["DockerRegistryImageName"], "Machine");
[Environment]::SetEnvironmentVariable("WebUIImageName", $OctopusParameters["WebUIImageName"], "Machine");
[Environment]::SetEnvironmentVariable("ApiImageName", $OctopusParameters["ApiImageName"], "Machine");
[Environment]::SetEnvironmentVariable("DatabaseImageName", $OctopusParameters["DatabaseImageName"], "Machine");
[Environment]::SetEnvironmentVariable("version", $OctopusParameters["version"], "Machine");





#set Sessionbase env var for other script to be use
$env:DockerRegistry = [Environment]::GetEnvironmentVariable("DockerRegistry","Machine");
$env:InternalNetworkName = [Environment]::GetEnvironmentVariable("InterNetworkname","Machine");
$env:SQLInstanceName = [Environment]::GetEnvironmentVariable("SQLInstanceName","Machine");
$env:DockerRegistryImageName = [Environment]::GetEnvironmentVariable("DockerRegistryImageName","Machine");
$env:WebUIImageName = [Environment]::GetEnvironmentVariable("WebUIImageName","Machine");
$env:ApiImageName = [Environment]::GetEnvironmentVariable("ApiImageName","Machine");
$env:DatabaseImageName = [Environment]::GetEnvironmentVariable("DatabaseImageName","Machine");
$env:MessageConnectionString = [Environment]::GetEnvironmentVariable("MessageConnectionString","Machine");
$env:Version = [Environment]::GetEnvironmentVariable("version","Machine");

Write-Host "---------------------------Docker-------------------------------"
Write-Host "  DockerRegistry : $env:DockerRegistry"
Write-Host "  InternalNetworkName : $env:InternalNetworkName"
Write-Host "  SQLInstanceName : $env:SQLInstanceName"
Write-Host "  WebUIImageName : $env:WebUIImageName"
Write-Host "  ApiImageName : $env:ApiImageName"
Write-Host "  DatabaseImageName : $env:DatabaseImageName"
Write-Host "----------------------------------------------------------------"



Write-Host "---------------------------Application--------------------------"
Write-Host "  MessageConnectionString : $env:MessageConnectionString"
Write-Host "----------------------------------------------------------------"