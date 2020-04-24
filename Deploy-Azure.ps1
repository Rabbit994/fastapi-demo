#az acr build --image fastapi/example:v1 --registry fastapiacr --file .dockerfile .
Start-Process 'az' -ArgumentList 'acr build --image fastapi/example:v1 --registry fastapiacr --file .dockerfile .'
