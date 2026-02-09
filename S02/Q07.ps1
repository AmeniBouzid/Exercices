#Écrivez un script qui recherche tous les fichiers se terminant par .log dans un dossier (Chemin absolue). 
#Le script doit uniquement cibler les fichiers créés il y a plus de 30 jours et les déplacer vers un dossier 
#d'archivage dans le même dossier que votre script (variable chemin du script).

#test Get-ChildItem ... | ForEach-Object {$_.CreationTime = "202-11-02 12:00:00"}


 
#Get-ChildItem -path "C:\Users\2461695" | Where-Object {$_.Extension -eq ".log"} | ForEach-Object {$_.CreationTime.AddDays(-30)}    

  New-Item $PSScriptRoot\Archive -ItemType Directory -Force > $null
  New-Item $PSScriptRoot\Archive\test.log -ItemType File -Force > $null  
  New-Item $PSScriptRoot\Archive\test_vieux.log -ItemType File -Force |
  ForEach-Object{$_.CreationTime = "202-11-02 12:00:00"} 

  Get-ChildItem $PSScriptRoot -Filter *.log | where CreationTime -lt (Get-Date).AddDays(-30) | Move-Item -Destination $PSScriptRoot\Archive  