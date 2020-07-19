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

Function InstallChocolatey {
    Set-ExecutionPolicy Bypass -Scope Process
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Function InstallNeovim {
    # Install neovim (pre was needed since 0.4.3 had a bug, not printing eg $ on altgr+4)
    choco install neovim --pre -y

    # Install vim-plug
    md ~\AppData\Local\nvim-data\site\autoload
    $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    (New-Object Net.WebClient).DownloadFile(
        $uri,
        $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            "~\AppData\Local\nvim-data\site\autoload\plug.vim"
        )
    )

    # Symlink nvim configfile from win10 dotfiles repo
    Start-Process -FilePath "$env:comspec" -ArgumentList "/k", "mklink",
	"`"C:\Users\oyvind\AppData\Local\nvim\init.vim`"",
	"`"C:\Users\oyvind\dotfiles\win10\configfiles\nvim\init.vim`""
}

Function InstallStuff {
    winget install Postman.Postman
}
