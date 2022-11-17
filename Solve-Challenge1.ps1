function Assert-ValidUser($user) {
    return (
        $user -like "*usr:*" -and
        $user -like "*eme:*" -and
        $user -like "*psw:*" -and
        $user -like "*age:*" -and
        $user -like "*loc:*" -and
        $user -like "*fll:*"
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
