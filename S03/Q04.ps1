
Get-ChildItem | Get-Member -PSPath $path -Directory -Name
clear
$listUser = @()
foreach ($user in Get-ChildItem 'C:\Users') {
    $objUser=[PSCustomObject]@{
    NomUtiliateur =$user.Name
    CheminProfil = $user.FullName
} 
$listUser += $objUser
}
$listUser 