FROM microsoft/aspnet

ADD . /inetpub/wwwroot

# Workaround for Windows container name DNS resolution issue
RUN powershell -Command Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

