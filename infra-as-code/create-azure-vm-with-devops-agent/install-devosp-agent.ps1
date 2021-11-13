
# Random string generation:

$vmname = hostname

$set = "abcdefghijklmnopqrstuvwxyz0123456789".ToCharArray()
# random string of length = 5
for ($x = 0; $x -lt 5; $x++) { $rand_string += $set | Get-Random}

$agent_name = "$vmname-$rand_string"


$my_url = 'https://vstsagentpackage.azureedge.net/agent/2.195.0/vsts-agent-win-x64-2.195.0.zip'

New-Item -Path 'C:\agent\agent' -ItemType Directory

$DownloadZipFile = "C:\agent\agent\" + $(Split-Path -Path $my_url -Leaf)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri $my_url -OutFile $DownloadZipFile

Expand-Archive -Path $DownloadZipFile -DestinationPath 'C:\agent\'

# Powershell.exe -executionpolicy remotesigned -File  C:\agent\config.cmd 

cmd.exe /c 'C:\agent\config.cmd'


# Enter server URL: https://dev.azure.com/rswarnka/
# Enter Authentication Type (Press Enter for PAT): 
# Enter Personal Access Token: 37rw3gdf2vye7dfo3l7oe2euwx4o473wyihvcqhycycsd4p6mkmq
# Enter agent pool : Org-Level-Agent-Pool
# Enter agent name: $agent_name
# Enter work folder (press enter for _work): <enter> 
# Enter Y/N : run agent as service: Y
# Enter user account to be used for service: (Press enter for NT Authority\Network Service): <enter> 
# Enter whether to prevent service starting immediately after configuration is finished? (Y/N) (press enter for N) > N
# Service vstsagent.rswarnka.Org-Level-Agent-Pool.hello-test started successfully

