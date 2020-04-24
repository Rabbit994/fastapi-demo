import requests

class WeatherStation:

    def __init__(self):
        self.headers = {'accept':'application/geo+json'}

    def __get_weather(self,uri):
        r = requests.get(url=uri,headers=self.headers)
        data = r.json()
        return data
    
    def get_weather_from_station(self, station:str):
        uri = "https://api.weather.gov/stations/{0}/observations/latest".format(station)
        observation = self.__get_weather(uri)
        observation = observation['properties']
        returnresponse = {'barometricPressure': observation['barometricPressure']['value'] / 100} 
        returnresponse['temperature'] = round((float(observation['temperature']['value']) * 1.8) + 32, 2) #Convert to F
        returnresponse['windspeed'] = observation['windSpeed']['value']
        returnresponse['dewpoint'] = round((float(observation['dewpoint']['value']) * 1.8) + 32, 2) #Convert to F
        return returnresponse