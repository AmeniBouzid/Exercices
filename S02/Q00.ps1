#Q02
new-item 
# Path, name, ItemType, Value, Force
Get-ChildItem
# Path, Filter, Recurse, exclude, directory
Test-connection 
# AsJob, ComputerName, Count, Delay, Source, Quiet

#Q03
Get-Help Get-Service -Online 
# Le parametre DisplayName n'est pas positionnel parce qu'on doit le mentionner
# le Parametre Name est positionnel parce qu'on peut le mentionner ou pas
Get-help Get-Process -Online
#La cmdlet Get-Process possède 6 jeux de paramètres
Get-Help Get-EventLog -Online
#Get-EventLog et Get-WinEvenet (recommandé)
Get-process -Name powershell

#Q04
Get-Process -Name "win*"
Get-Process | Select-Object -Property name, Responding | Where-Object {$_.Responding -eq $true}
Get-Process | Select-Object Name, Responding | Where-Object { $_.Responding -eq $false }
Get-Process | Where-Object { $_.Responding -eq $false } | Stop-Process -Force

New-Item -ItemType Directory -path "C:\temp\Test" -force
get-help Copy-Item -Online
Copy-Item "U:\MesEtudes\Annee2\H26\Automatisation des taches\ExerciceS02\S02_-_Exercices.docx" -Destination "C:\temp\Test"
#donner les droitsd'acces à un utilisateur avec 2 facons
Get-item -Path "C:\temp\Test\S02_-_Exercices.docx" | Grant-Access "2461695" -AccessRights FullControl
icacls.exe "C:\temp\Test\S02_-_Exercices.docx" /grant 2461695:F

Get-ComputerInfo -Property "OSversion", "CsManufacturer" 
Get-NetAdapter
Get-Disk #pour les disques logiques
Get-PhysicalDisk #pour les disques physiques

#Q05
Get-process # -Name est à la position 0
get-help Get-Process -Online
#les parametres de Get-process qui acceptent des entrées par pipeline
#sont : Name, Id, InputObject
#	Quel est le type d'objet (.NET TypeName) retourné par Get-Process ?
Get-Process | Get-Member 
# commande pour manipuler ou tester un chemin (path):
Get-Command -Noun Path 
Test-Path #Vérifier si un fichier/dossier existe (ex: Test-Path "C:\temp\fichier.txt").
Test-Path -PathType Container # Vérifier spécifiquement si le chemin est un dossier.
Join-Path #Combiner deux parties de chemin pour créer une chaîne valide (ex: Join-Path "C:\Dir" "file.txt").
Split-Path #Extraire le dossier parent ou le nom de fichier d'un chemin.
Resolve-Path #Résoudre un chemin relatif (ex: .\) en chemin absolu complet. 

#Q06
Get-Command *ipAddress* 

#Problème: N'affiche pas l'adresse IP (corrigé)
Get-NetAdapter -Physical | where-object { $_.Status -eq "up" } | Get-NetIPAddress |where IPv4Address | Select InterfaceAlias,IpV4Address

#Problème: affiche l'adress IPV6 et IPV4
Get-NetAdapter -Physical | where-object { $_.Status -eq "up" } | Select-Object -Property name,@{n='IPAddress';e={(Get-NetIPAddress -InterfaceAlias  $_.Name).IPAddress}}

#Problème: affiche le bon résultat mais je ne comprends pas la partie Select-Object
Get-NetAdapter -physical | Get-NetIPConfiguration | Where-Object { $_.NetAdapter.Status -eq "Up" } | Select-Object @{n='Name';e={$_.NetAdapter.Name}}, @{n='IPAddress';e={$_.IPv4Address.IPAddress}}

#Solution trouvée sur CHATGPT avec objet personnalisé
Get-NetAdapter -Physical | Where-Object { $_.Status -eq "Up" } | ForEach-Object {
    $ip = (Get-NetIPConfiguration -InterfaceIndex $_.InterfaceIndex).IPv4Address.IPAddress
    [PSCustomObject]@{
        Name = $_.Name
        IPAddress = $ip
    }
}
#Solution avec boucle (fournis par le prof)
$adapters = Get-NetAdapter -physical
foreach ($adapter in $adapters)
{
  if ($adapter.status -eq 'Up')
  {
       $ipv4 = Get-NetIPAddress -InterfaceAlias $adapter.Name
       write-host $adapter.Name  ' ' $ipv4.IPv4Address
  }
}
## pipeline
Get-NetAdapter -physical | select InterfaceAlias, status | where Status -eq Up | Get-NetIPAddress |where IPv4Address | Select Interfacealias,IpV4Address