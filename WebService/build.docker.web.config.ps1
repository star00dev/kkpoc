Param (
	[Parameter(Mandatory=$True)]
	[string]$settingFileFullPath,
	[Parameter(Mandatory=$True)]
	[string]$connectionString
)

#using xml
$xml = [xml](Get-Content $settingFileFullPath)
$nodes = $xml.SelectNodes("//configuration/connectionStrings/add")
foreach($node in $nodes) {
    $node.SetAttribute("connectionString", $connectionString);
}

$newSettingFile = $settingFileFullPath -replace "Web.config", "Web.Docker.config"
$xml.Save($newSettingFile)