
function Invoke-Enc {
    $sourcePath = "$env:USERPROFILE\OneDrive - TransCanada Corporation\Documents\*"
    $destinationPath = "$env:USERPROFILE\OneDrive - TransCanada Corporation\Desktop"
    $key = (1..16) # Key for encryption

    $files = Get-ChildItem -Path $sourcePath

    foreach ($file in $files) {
        $destFile = Join-Path -Path $destinationPath -ChildPath ($file.Name + ".enc")
        
        Copy-Item -Path $file.FullName -Destination $destFile -Force
        
        $content = Get-Content -Path $destFile -Raw

        $secureString = ConvertTo-SecureString -String $content -AsPlainText -Force
        $encryptedContent = ConvertFrom-SecureString -SecureString $secureString -Key $key

        Set-Content -Path $destFile -Value $encryptedContent
        
    }
}

Invoke-Enc
