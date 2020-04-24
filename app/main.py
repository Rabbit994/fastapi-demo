from fastapi import FastAPI, HTTPException
from .routers import calc, greet, weather

app = FastAPI()

@app.get("/ping")
def ping():
    return 'pong'

app.include_router(
    calc.router,
    prefix="/calc",
    tags=["calc"],
    responses={404: {"description": "Not found"}},
)
app.include_router(
    greet.router,
    prefix="/greet",
    tags=['greet'],
    responses={404: {"description": "Not found"}},
)

app.include_router(
    weather.router,
    prefix="/weather",
    tags=['weather'],
    responses={404: {"description": "Not found"}},
)