from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from ..modules import weathermodule

router = APIRouter()

@router.get("/reston")
def get_reston_weather():
    weather = weathermodule.WeatherStation()
    return weather.get_weather_from_station('KIAD')

@router.get("/atlanta")
def get_atlanta_weather():
    weather = weathermodule.WeatherStation()
    return weather.get_weather_from_station('KATL')

@router.get("/stlouis")
def get_stlouis_weather():
    weather = weathermodule.WeatherStation()
    return weather.get_weather_from_station('KSTL')

@router.get("/ping")
def weather_ping():
    weather = weathermodule.WeatherStation()
    test = weather.get_weather_from_station('KDCA')
    if not bool(test):
        raise HTTPException(status_code=503,detail="Failed Pong")
    else:
        return 'pong'

#Note, paths are created bottom to top
@router.get("/{station_name}")
def get_weather_by_station_name(station_name:str):
    weather = weathermodule.WeatherStation()
    return weather.get_weather_from_station(station=station_name)


        