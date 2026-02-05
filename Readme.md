 git config --global user.name "AmeniBouzid"
 git config --global user.email "2461695@cegeplimoilou.ca"

# Récupère les listes de contrôle d'accès (ACL) du fichier script02.ps1 dans le répertoire courant.
Get-Acl .\script02.ps1

# Affiche toutes les propriétés et méthodes disponibles sur l'objet retourné par Get-Acl.
Get-Acl .\script02.ps1 | Get-Member

# Affiche le nom d'utilisateur actuel stocké dans la variable d'environnement USERNAME.
$env:USERNAME

# Filtre les ACL pour ne montrer que celles où le propriétaire est `CLIM\VotreNom`
Get-Acl .\script02.ps1 | Where-Object Owner -EQ "CLIM\$env:USERNAME"

<#
Décomposition :
    1. `Get-Acl .\script02.ps1` - Récupère les ACL
    2. `Where-Object Owner -Match $env:USERNAME` - Filtre : garde seulement si le propriétaire contient votre nom d'utilisateur (`-Match` utilise des expressions régulières)
    3. `select AccessToString` - Affiche seulement la propriété AccessToString, qui contient une représentation textuelle lisible de toutes 
#>
Get-Acl .\script02.ps1 | Where-Object Owner -Match $env:USERNAME | select AccessToString