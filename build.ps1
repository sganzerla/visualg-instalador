try {
  Get-Command makensis -ErrorAction Stop | Out-Null
}
catch {
  Write-Error 'NSIS compiler not found.' -Category NotInstalled -ErrorAction Stop
}

if (Test-Path 'dist') {
  Get-ChildItem 'dist' | Remove-Item -Recurse -Force
}
else {
  New-Item -Type Directory 'dist' | Out-Null
}

 
Write-Host 'Building installer...' -ForegroundColor Yellow
makensis .\install.nsi 
 
Write-Host "`r`nPronto!" -ForegroundColor Green
Pause