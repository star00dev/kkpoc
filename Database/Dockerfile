FROM microsoft/mssql-server-windows-developer

CMD mkdir c:\database

ADD . c:\database

CMD ["powershell","Copy-Item","C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\*", "C:\SQLData"]

CMD ["c:\database\bin\release\database.exe"]
