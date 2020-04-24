if ((Test-Path '.env') -eq $false){
    Start-Process 'python.exe' -ArgumentList '-m venv .env' -Wait -NoNewWindow
}
Invoke-Expression -Command '.\.env\Scripts\Activate.ps1' #Activate Virtual Environment
Start-Process 'pip3' -ArgumentList 'install -r requirements.txt' -Wait -NoNewWindow
start-process 'uvicorn' -ArgumentList 'app.main:app'
Start-Sleep -Seconds 5 #Wait for uvicorn to fire up
Invoke-Expression -Command '.\PSTest\Invoke-Tests.ps1 -URI http://127.0.0.1:8000' #Run Pester