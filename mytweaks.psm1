Function SetKeyboardFast {
    Write-Output "Setting keyboard repeat delay to shortest and repeat rate to fastest"
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type String -Value 0
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Type String -Value 31
}

Function SetKeyboardDefault {
    Write-Output "Setting keyboard repeat delay and repeat rate to default"
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type String -Value 1
    Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Type String -Value 25
}
