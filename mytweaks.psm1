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
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Rename computer to x1c
Function RenameComputer-x1c {
    Rename-Computer -NewName x1c # -LocalCredential $env:computername\Administrator -PassThru
}

Function InstallWSL {
    #    
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
    # 0-9
    choco install 7zip -y                               # ok
    choco install 7-taskbar-tweaker -y

    # A
    choco install alacritty -y                          # ok  
    choco install ag -y                                 # ok - the silver searcher
    choco install autohotkey -y                         # ok
    choco install adobereader -y
    choco install angryip -y
    choco install arduino -y
    choco install autodesk-fusion360 -y
    choco install adblockplus-firefox -y

    # C
    choco install chocolateygui -y
    choco install conemu -y
    choco install citrix-receiver -y
    choco install calibre -y
    choco install cpu-z -y
    choco install cura -y
    # winget install Toinane.Colorpicker

    # D
    choco install dropbox -y                            # ok
    choco install docker-desktop -y
    choco install docker-cli -y
    choco install dolphin -y
    choco install dropbox -y
    choco install docker-kitematic -y
    choco install drawio -y
    choco install directx -y                            # ok

    # E
    choco install etcher -y                             # ok
    choco install evernote -y

    # F
    choco install f.lux -y                              # ok
    choco install firefox -y                            # ok
    choco install fzf -y
    choco install flutter -y
    choco install filezilla -y
    choco install freecad -y

    # G
    choco install GoogleChrome -y                       # ok
    choco install git -y
    choco install github-desktop -y
    choco install gh -y # github-cli
    choco install gpg4win -y
    choco install gnupg -y
    choco install googledrive -y
    choco install googleearth -y
    choco install gpu-z -y

    # H
    choco install hwinfo -y                             # ok
    choco install hwmonitor -y
    choco install heroku-cli -y

    # I
    choco install intel-xtu -y                          # not tested
    choco install intel-dsa -y                          # not tested - intel driver and support assistant
    choco install imagemagick.app -y

    # J
    choco install jre8 -y

    # K
    choco install kodi -y

    # L
    choco install lastpass -y                           # ok
    #choco install lastpass-for-applications -y

    # M
    choco install mousewithoutborders -y
    choco install myharmony -y
    choco install msiafterburner -y

    # N
    choco install nextcloud-client -y
    choco install nodejs -y
    choco install notepadplusplus -y

    # O
    choco install openvpn -y                            # ok
    choco install office365business -y                  # ok

    # P
    winget install Postman.Postman                      # not tested
    choco install plex -y                               # ok
    choco install pgadmin4 -y                           # ok
    choco install postman -y                            # ok
    choco install python -y                             # ok
    choco install powertoys -y                          # ok
    choco install pdf24 -y
    choco install poweriso -y
    #choco install postgresql

    # R
    choco install retroarch -y                          # ok
    choco install r -y                                  # ok
    choco install r.studio -y                           # ok - install r packages as well?


    # S
    choco install spotify -y                            # ok 
    choco install lenovo-thinkvantage-system-update -y  # not tested - is this thinkvantage or the old system update?
    choco install slack -y                              # ok
    choco install skype -y                              # ok
    choco install steam -y
    choco install sysinternals
    choco install simplenote
    choco install skypeforbusiness
    choco install syncthing
    choco install signal
    choco install synctrayzor # syncthing tray tool
    choco install shutup10 -y
    # winget install SSHFS-Win.SSHFS-Win # not sure about this, seems to be broken in chocolatey
    # SSHFS-win also requires WinFSP:  winget install WinFsp.WinFsp

    # T
    choco install transmission -y                       # ok 
    choco install transgui -y                           # ok
    choco install microsoft-teams -y                    # ok
    choco install teamviewer -y
    winget install Nadeo.TrackManiaNationsForever -y    # ok
    choco install treesizefree -y

    # U
    winget install Canonical.Ubuntu                     # ok

    # V
    choco install vscode -y                             # ok
    choco install vmware-horizon-client -y
    choco install vlc -y
    choco install vcredist140 -y                        # visual c++ redistr
    choco install ventoy -y

    # W
    choco install winrar -y                             # ok 
    choco install wkhtmltopdf -y
    choco install win32diskimager.install -y
    choco install whatsapp -y
    choco install microsoft-windows-terminal -y         # ok
    choco install wget -y
    choco install windirstat -y

    # Y
    choco install yarn -y

    # Z
    choco install zoom -y
    choco install zoom-outlook -y




}

function Install3Dprinter {
    
}
