A job is a set of steps that are excuted by an agent in a queue (or pool). Jobs are atomic

Type of Jobs: 

1. By parallelism: Single or Multi Job. Multi Job run Serially, Mutijob with parallelism 
2. By Agent: Container Job or Agent Job or Agentless Job 



H:\InstalledSoftwares\azdo_buildagent>config.cmd

  ___                      ______ _            _ _
 / _ \                     | ___ (_)          | (_)
/ /_\ \_____   _ _ __ ___  | |_/ /_ _ __   ___| |_ _ __   ___  ___
|  _  |_  / | | | '__/ _ \ |  __/| | '_ \ / _ \ | | '_ \ / _ \/ __|
| | | |/ /| |_| | | |  __/ | |   | | |_) |  __/ | | | | |  __/\__ \
\_| |_/___|\__,_|_|  \___| \_|   |_| .__/ \___|_|_|_| |_|\___||___/
                                   | |
        agent v2.195.0             |_|          (commit 805596a)


>> Connect:

Enter server URL > https://dev.azure.com/rswarnka/
Enter authentication type (press enter for PAT) >
Enter personal access token > ****************************************************
Connecting to server ...

>> Register Agent:

Enter agent pool (press enter for default) > Org-Level-Agent-Pool
Enter agent name (press enter for RSWARNKAR-PC) > my-home-windows-pc-agent
Scanning for tool capabilities.
Connecting to the server.
Successfully added the agent
Testing agent connection.
Enter work folder (press enter for _work) >
2021-11-14 01:53:28Z: Settings Saved.
Enter run agent as service? (Y/N) (press enter for N) > y
Enter User account to use for the service (press enter for NT AUTHORITY\NETWORK SERVICE) >
Granting file permissions to 'NT AUTHORITY\NETWORK SERVICE'.
Service vstsagent.rswarnka.Org-Level-Agent-Pool.my-home-windows-pc-agent successfully installed
Service vstsagent.rswarnka.Org-Level-Agent-Pool.my-home-windows-pc-agent successfully set recovery option
Service vstsagent.rswarnka.Org-Level-Agent-Pool.my-home-windows-pc-agent successfully set to delayed auto start
Service vstsagent.rswarnka.Org-Level-Agent-Pool.my-home-windows-pc-agent successfully configured
Enter whether to prevent service starting immediately after configuration is finished? (Y/N) (press enter for N) > n
Service vstsagent.rswarnka.Org-Level-Agent-Pool.my-home-windows-pc-agent started successfully

H:\InstalledSoftwares\azdo_buildagent>



Install Azure Pipelines from the GitHub Marketplace.
Integrate a GitHub project with an Azure DevOps pipeline.
Track pull requests through the pipeline.