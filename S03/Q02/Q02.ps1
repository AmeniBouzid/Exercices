Param (
    [string]$path = "$PSScriptRoot\ip.csv"
)

#$path = "$PSScriptRoot\ip.csv"
$csvFile = Import-csv -path $path 

foreach ($line in $csvFile){
    $line.AdresseIP
    $connected =Test-Connection $line.AdresseIP -count 1 -quiet -ErrorAction SilentlyContinue
    if ($connected) {
        $line.Statut = 'connected'
        $line.NomServeur = [System.Net.Dns]::GetHostEntry($line.AdresseIP).HostName
    }
    else {
        $line.Statut = 'disconnected'
    }
    [System.Net.Dns]::GetHostEntry('8.8.8.8').HostName
}
$csvFile | Export-Csv -Path $path -NoTypeInformation