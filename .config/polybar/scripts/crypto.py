#!/usr/bin/env python3

import sys
import requests
from decimal import Decimal

# Everything except the general section
base_currency = 'USD'
params = {'convert': base_currency}
icon = ''

# Request price
try:
	response = requests.get(f'https://api.coinmarketcap.com/v1/ticker/bitcoin',
									params=params)
	[json] = response.json()

	local_price = round(Decimal(json[f'price_{base_currency.lower()}']), 2)
	change_24 = float(json['percent_change_24h'])

	display_opt = 'price'
	if display_opt == 'both' or display_opt == None:
		sys.stdout.write(f'{icon} {local_price}/{change_24:+}%')
	elif display_opt == 'percentage':
		sys.stdout.write(f'{icon} {change_24:+}%')
	elif display_opt == 'price':
		sys.stdout.write(f'{icon} {local_price}')
except:
	pass
