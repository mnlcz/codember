function Assert-ValidUser($User) {
    return (
        $User -like "*usr:*" -and
        $User -like "*eme:*" -and
        $User -like "*psw:*" -and
        $User -like "*age:*" -and
        $User -like "*loc:*" -and
        $User -like "*fll:*"
    )
}

$input = Get-Content -Path ./inputs/input1.txt -Raw
$input = $input -replace "`n`n", "---" 
$input = $input.Split("---")
$counter = 0
$user = ""
$input.ForEach{
    if (Assert-ValidUser $_) {
        $counter++
        $user = ($_ | Select-String -Pattern "usr:\S+").Matches.Value
    }
}
$user = $user.Substring(4)
Write-Host "submit $counter$user"
