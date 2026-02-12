#Ce script permet de convertir une adresse IPv4 en binaire
# Etudiants: Ameni Bouzid et Eddy Manoa Randrianarison

[CmdletBinding()]
param (
[Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
[ValidateScript({ $_ -ge 0 })]
[ValidatePattern('^(\d{1,3}\.){3}\d{1,3}$')]
    [string]$adresseIPv4
)
# Convertir une adresse IPv4 en binaire
process{

$octet = $adresseIPv4.Split('.')
$resultat = @()
foreach ($octet in $octet) {
    if ($octet -gt 255) {
        Write-Host "Chaque octet doit être compris entre 0 et 255."
    return
    }
    [int]$n= $octet
$binaire = ""

while ($n -gt 0) {
    $reste = $n % 2
    $n = [Math]::Floor($n / 2)
    $binaire = $reste.ToString() + $binaire 
   # Write-Debug " reste: $reste n: $n binaire: $binaire"
}
$binaire = $binaire.PadLeft(8, '0')
$resultat += $binaire 
}
$resultat -join '.'
}
