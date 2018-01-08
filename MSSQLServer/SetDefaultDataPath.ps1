# Change default mdf, ldf folder to C:\SQLData
$ChangeDefaultDataPath = "EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE'
	, N'Software\Microsoft\MSSQLServer\MSSQLServer'
	, N'DefaultData'
	, REG_SZ
	, N'C:\SQLData';
	EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE'
	, N'Software\Microsoft\MSSQLServer\MSSQLServer'
	, N'DefaultLog'
	, REG_SZ
	, N'C:\SQLData';"

Write-Verbose "Invoke-Sqlcmd -Query $($ChangeDefaultDataPath)"
& sqlcmd -Q $ChangeDefaultDataPath;

# Stop Service
stop-service MSSQLSERVER


# Start Service
start-service MSSQLSERVER