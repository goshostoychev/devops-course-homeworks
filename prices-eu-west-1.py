from functools import reduce

import requests, json

api_base = 'https://pricing.us-east-1.amazonaws.com'

api_one = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonRDS/current/region_index.json'

response = requests.get(api_one)
j = response.json()

res = (j['regions']['eu-west-1']['currentVersionUrl'])

final_url = api_base + res

new = requests.get(final_url).json()

on_demand = new['terms']['OnDemand']
target = 'db.t3'

for key, value in on_demand.items():
    for v in value.values():
        for p in v['priceDimensions'].values():
            if target in p['description']:
                print(p['pricePerUnit']['USD'], p['description'], sep=', ', end='\n')
