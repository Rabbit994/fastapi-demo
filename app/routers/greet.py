from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

router = APIRouter()

@router.get('/hello/{name}')
def hello(name:str):
    """Return greeting"""
    return {'Salutation': "Hello {0}".format(name)}

@router.get('/goodbye/{name}')
def goodbye(name:str):
    return {'Salutation': "Goodbye {0}".format(name)}

@router.get("/ping",status_code=200)
def ping():
    return 'pong'

