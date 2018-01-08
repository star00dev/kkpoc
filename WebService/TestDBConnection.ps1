$SQLServer = "$env:DBServer,$env:DBPort" #use Server\Instance for named SQL instances! 
$SQLDBName = "Message"
$SQLLogin = "sa"
$SQLPassword = "Admin123"
$SqlQuery = "SELECT top 1000 * FROM [Message].[dbo].[Messages];"

$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; User Id=$SQLLogin;Password=$SQLPassword;"

$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection

$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd

$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)

$SqlConnection.Close()

#clear

$DataSet.Tables[0]