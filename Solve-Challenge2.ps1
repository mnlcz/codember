# Rango de "a" hasta "z", la equivalencia con ascii se da al acceder a un elemento via su <Codigo> - 97
#   EJ: El codigo de la letra "h" es 104
#       $h = 104
#       $lowerCaseAscii[$h - 97]
#           => "h"
$lowerCaseAscii = "a".."z"

function ConvertTo-Word([string]$Num) {
    $code = ""
    $out = ""
    $n = 1
    $Num.ToCharArray().ForEach{
        if ($n -eq $Num.Length) {
            $code += "$_"
        }
        if ([int]$code -in 97..122 ) {
            $out += $lowerCaseAscii[[int]$code - 97]
            $code = "$_"
        }
        else {
            $code += $_
        }
        $n++
    }
    $out
}

$in = (Get-Content -Path ./inputs/input2.txt -Raw) -split " "
$words = New-Object System.Collections.Generic.List[string]
$in.ForEach{ $words.Add((ConvertTo-Word -Num $_)) }
$words = $words -join " "
Write-Host "submit $words"
