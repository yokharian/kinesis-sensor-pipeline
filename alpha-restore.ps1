# $pwshellProf = '$env:PSModulePath = $env:PSModulePath + "$([System.IO.Path]::PathSeparator)C:\Users\drapaiton\Documents\WindowsPowerShell\Modules"
$USERNAME = drapaiton
Set-ExecutionPolicy Bypass
Set-ExecutionPolicy RemoteSigned
$msgBoxInput =  [System.Windows.MessageBox]::Show('You are in the Step 0 or in the step 1?','Game  input','YesNoCancel','Error')
switch  ($msgBoxInput) {
  'Yes' { # part 1 ...
    # Custom Windows Terminal
    [System.Windows.MessageBox]::Show('Instala La fuente cascadia-code')
    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    
    # powershell profile
    if (!(Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }
    $pwshellProf = '$env:PSModulePath = $env:PSModulePath + "$([System.IO.Path]::PathSeparator)C:\Users\'+$USERNAME+'\Documents\WindowsPowerShell\Modules"
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox'
    Add-Content $PROFILE $pwshellProf


    #install chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    # Needed
    choco install wsl git docker-desktop microsoft-windows-terminal winrar vscode toggl microsoft-teams
    # useful
    choco install postman mongodb-compass filezilla cpu-z.portable googledrive firefox
    # optional
    choco install discord whatsapp spotify 



    #restart
    $msgBoxInputRs = [System.Windows.MessageBoxResult]::Show('Would you like to restart now?','Game  input','YesNoCancel','Error')
    switch($msgBoxInputRs){
        'Yes'{
            Restart-Computer -delay 15
        }'No'{
            [System.Windows.MessageBox]::Show('Remember to Restart')
        }
    }
}'No' { #part 2 ..
  wsl --set-default-version 2
  [System.Windows.MessageBox]::Show("instala Debian desde la microsoft Store")
    # then
    # wsl --exec bash .\wsl-distro.sh
  }
}