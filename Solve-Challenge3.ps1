$in = Get-Content -Path ./inputs/input3.txt | ConvertFrom-Json
$counter = 0
$max = 0
$last = ""
$color1 = $in[0]
$color2 = $in[1]
for ($i = 2; $i -lt $in.Length; $i++) {
    if ($in[$i] -eq $color1) {
        $counter++
        $last = $color2
    }
    else {
        $counter = 2
    }
    if ($counter -gt $max) {
        $max = $counter
    }
    $color1 = $color2
    $color2 = $in[$i]
}
$last = $last -replace "`"", ""
Write-Host "submit $max@$last"
