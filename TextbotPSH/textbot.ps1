Add-Type -AssemblyName System.Windows.Forms

$dirPath = Read-Host "Введи папку [пример]"
$configFilePath = $PSScriptRoot + "\" + "$dirPath" + "\test.txt"
$varPath1 = $PSScriptRoot + "\" + "$dirPath" + "\var1.txt"
$varPath2 = $PSScriptRoot + "\" + "$dirPath" + "\var2.txt"
$varPath3 = $PSScriptRoot + "\" + "$dirPath" + "\var3.txt"
$varPath4 = $PSScriptRoot + "\" + "$dirPath" + "\var4.txt"
$varPath5 = $PSScriptRoot + "\" + "$dirPath" + "\var5.txt"

$string = Get-Content -Path $configFilePath
$var1 = Get-Content -Path $varPath1
$var2 = Get-Content -Path $varPath2
$var3 = Get-Content -Path $varPath3
$var4 = Get-Content -Path $varPath4
$var5 = Get-Content -Path $varPath5

$string = $string -replace "\{var1\}", $var1 -replace "\{var2\}", $var2 -replace "\{var3\}", $var3 -replace "\{var4\}", $var4 -replace "\{var5\}", $var5

$names = $string -split '
'
# Функция для отправки клавиш
function Send-Keys {
    param(
        [string]$text
    )
    [System.Windows.Forms.SendKeys]::SendWait($text)
}

timeout 3

# Проход по каждому имени и отправка
foreach ($name in $names) {
    Send-Keys $name
    Send-Keys "{ENTER}" # Отправляет клавишу Enter
    Start-Sleep -Milliseconds 500 # Задержка между вводами, если необходимо
}
Write-Host "Press any key to continue ....."$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")