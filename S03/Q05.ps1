[CmdletBinding()]
param (
[Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
[ValidateScript({ $_ -ge 0 })]
[int]$base10 
)
# Convertir un nombre base 10 en base 2
# avec boucle

#[convert]::ToString(9, 2)
process{
[string]$b = ""
[int]$n= $base10

while ($n -gt 0) {
    $reste = $n % 2
    $n = [Math]::Floor($n / 2)
    $b = $reste.ToString() + $b 
    Write-Debug " reste: $reste n: $n b: $b"
}
$b
}