from datetime import datetime
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')
db = client.covid19
collection = db.daily

for result in collection.find({"Country_Region": "Mexico", "Province_State":"Michoacan"}):
    print (result)