System Requirements:  
Python 3.7  
virtualenv module for python installed  
Python in path  
Powershell 5.1/6 Core (Linux supported)  

This is example of Python FastAPI Library API.

It has three endpoints, /calc /greet /weather, you can see documents for API by going to http://website/docs and reading the docs, if you run the application locally, it will be http://127.0.0.1:8000/docs

Pester tests are in PSTest/Invoke-Tests.ps1

Powershell method of running Application:  
To run Application locally, you can either invoke Powershell script "Run-ApplicationLocally.ps1" which will setup virtual environment, activate virtual environment, pip install the proper modules, launch the application and run Pester Tests to prove it's online

Manual method to run Application:  
Create Virtual Environment in Python (python3 -m venv .env)  
Activate Python Virtual Environment (./.env/Scripts/Activate.ps1)  
Run pip with requirements.txt to install all requirements (pip3 install -r requirements.txt)  
Run following command: uvicorn app.main:app and it will launch the website on all interfaces and listening on port 8000

