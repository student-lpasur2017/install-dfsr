# Installation du service DFSR
Install-WindowsFeature -Name FS-DFS-Replication -IncludeManagementTools -IncludeAllSubFeature

# Installation de l'outil de gestion DFS
Install-WindowsFeature -Name RSAT-DFS-Mgmt-Con -IncludeManagementTools -IncludeAllSubFeature
