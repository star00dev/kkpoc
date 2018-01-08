$settingFileFullPath = ".\web.config" 


$env:DBConnectionString = "metadata=res://*/DataModel.WebServiceDataModel.csdl|res://*/DataModel.WebServiceDataModel.ssdl|res://*/DataModel.WebServiceDataModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=172.16.110.26,60003;initial catalog=Message;user id=sa;password=Admin123;MultipleActiveResultSets=True;App=EntityFramework&quot;"

Write-Host "Updating web.config on $webconfigPath"
Write-Host "`tDataConnectionString : $env:DBConnectionString"

#using xml
$xml = [xml](Get-Content $settingFileFullPath)
$nodes = $xml.SelectNodes("//configuration/connectionStrings/add")
foreach($node in $nodes) {
	if ($nodes.Name -eq "MessageEntities"){
		$node.SetAttribute("connectionString", $env:DBConnectionString);
	}
}
$xml.Save($settingFileFullPath)