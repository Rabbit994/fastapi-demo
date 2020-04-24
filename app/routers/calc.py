from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from ..modules import calcmodule as calcmodule
router = APIRouter()

class Calc(BaseModel):
    op: str
    number1: int
    number2: int

@router.get("/add")
def add(number1:int, number2:int):
    return calcmodule.perform_operation(number1=number1,number2=number2,op="add")

@router.get("/subtract")
def subtract(number1:int, number2:int):
    return calcmodule.perform_operation(number1,number2,'subtract') #function variable can be just passed in order

@router.get("/multiply")
def multiply(number1:int, number2:int):
    return calcmodule.perform_operation(number1=number1,number2=number2,op="multiply")

@router.get("/divide")
def divide(number1:int, number2:int):
    return calcmodule.perform_operation(number1=number1,number2=number2,op="divide")

@router.get("/expo")
def expo(number1:int, number2:int):
    return calcmodule.perform_operation(number1,number2,'expo')

@router.post("/calc")
def calc(body: Calc):
    return calcmodule.perform_operation(body.number1,body.number2,body.op)

@router.get("/ping", status_code=200)
def ping():
    result = calcmodule.perform_operation(1,1,'add')
    if result['result'] == 2:
        return 'pong'
    else:
        raise HTTPException(status_code=503,detail="Failed Pong")
