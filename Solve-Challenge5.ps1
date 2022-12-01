class Item {
    [int]$Index
    [string]$Name
    Item($i, $n) {
        $this.Index = $i
        $this.Name = $n
    }
}

[string[]]$in = Get-Content -Path ./inputs/input5.json | ConvertFrom-Json
$alive = New-Object System.Collections.Generic.List[Item]
$run = $true
for ($i = 0; $i -lt $in.Length; $i++) {
    $x = [Item]::new($i, $in[$i])
    $alive.Add($x)
}

while ($run) {
    $aux = New-Object System.Collections.Generic.List[Item]
    for ($i = 0; $i -lt $alive.Count; $i += 2) {
        $aux.Add($alive[$i])
    }
    if ($alive.Count % 2 -ne 0) {
        $aux.RemoveAt(0)
    }
    $alive = $aux
    if ($alive.Count -eq 1) {
        $run = $false
    }
}

$name = $alive[0].Name
$index = $alive[0].Index
Write-Host "submit $name-$index"
