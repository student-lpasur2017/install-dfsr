# /!\ l'ajout de "-WhatIf" permet de checker l'effet de la commande si elle etait executee

# Installation du service DFSR
Install-WindowsFeature -Name FS-DFS-Replication -IncludeManagementTools -IncludeAllSubFeature

# Installation de l'outil de gestion DFS
Install-WindowsFeature -Name RSAT-DFS-Mgmt-Con -IncludeManagementTools -IncludeAllSubFeature

# Creation d'un nouveau groupe de replication DFS
New-DfsReplicationGroup -GroupeName "NomDuGroupe" -Description "Replication DFSR" -DomainName "NameDomaine.com" -WhatIf

# Ajout des membres

Add-DfsrMember -GroupeName "NomDuGroupe" -ComputerName "Srv1","Srv2" -WhatIf

# Choix du mode topologique

# Planification du groupe de replication et bande passante

# Selection du serveur principal qui contient les donnees initiales
  # -FolderName : Liste de dossier a Repliquer
  # -ContentPath : Chemin local de destination des fichiers qui seront repliques
  # -ComputerName : Nom SRV qui sera membre primaire
Set-DfsrMembership -GroupName "NomDuGroupe" -FolderName "Liste/Dossier/A/Repliquer" -ContentPath "Chemin/Dossier/local/pour/contenir/ficchiers/replique" -ComputerName "NomServeurPrimaire" -PrimaryMember $True -Force -WhatIf | Format-Table *name,*path,primary* -auto -wrap
