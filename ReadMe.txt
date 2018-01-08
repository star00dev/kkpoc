This is an example project template for developing 3 tiers application (UI, Service, DB)

Installation for Docker

1. download docker for windows from https://docs.docker.com/docker-for-windows/install/

2. Install the downloaded exe

2a. update the daemon.json on [C:\ProgramData\Docker\config] with the following content

	{  "registry-mirrors": [],  "insecure-registries": [    "<<dev-docker-hub-ip>>:5000"  ],  "debug": true,  "experimental": false,  "graph": "D:\\docker_data"}

3. In Docker menu switch to Windows Container

4. verify by runing the following command
	Docker version

	Note: Make sure "OS/Arch" for Server side is set to "windows/amd64"

   a. Make sure to change the web.config of the WebService project to point to <<HostIp>>
   b. Make sure to chagne the app.config of Database project to point to <<HostIp>>

5. Build the Solution

6. Make sure the "DockerRegistry" default value change to your <<HostIp>> in Build.ps1 and Deploy.ps1

7. At the Solution folder get to powershell and run the following commands

	1. ./Build.ps1
	2. ./Deploy.ps1

8. Project access URL 
	UI 		-> http:://<<HostIp>>:60001
	API 		->http://<<HostIp>>:60002/api/messages
	Database 	-> data source=<<HostIp>>,60003;initial catalog=Message;user id=sa;password=Admin123;

