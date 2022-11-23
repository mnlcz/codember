function Assert-Sorted([int]$Number) {
    $str = "$Number".ToCharArray()
    $i = -1
    $out = $true
    $str.ForEach{
        $n = [int]::Parse($_)
        if ($n -lt $i) {
            $out = $false
        }
        $i = $n
    }
    $out
}

$candidates = 11098..98123 | Where { "$_" -like "*55*" -and (Assert-Sorted -Number $_)}
$count = $candidates.Count
$value55 = $candidates[55]
Write-Host "submit $count-$value55"
