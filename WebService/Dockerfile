FROM microsoft/aspnet

# The final instruction copies the site you published earlier into the container.
ADD . /inetpub/wwwroot

# Workaround for Windows container name DNS resolution issue
RUN powershell -Command Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

#ENTRYPOINT ["powershell.exe", "/inetpub/wwwroot/StartUp.ps1"]
