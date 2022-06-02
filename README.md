# co2app
Quick Hack App for "Bunte Nacht der Digitalisierung" to visualize individual CO2 emissions

# Resources

## KA Logo
get it from 
https://transparenz.karlsruhe.de/
or use another logo



# Favicon
copy favicon.ico to public/ directory (from public/img/icons after asset generator)

# Data
code|string: optional, from query string
id|string: optional, set by server after first submission
msg|string: TBD
co2total: number
co2parms: parmaters from sectors 1 .. 6 (might become more or less)
location: district and additional people

Post example:

{"msg":"CO2App","code":"123","id":"dummy","co2total":10.98,"co2parms":{"sector1":{"value":2.835,"parms":{"size":50,"renew":false,"eco":false}},"sector2":{"value":2.16,"parms":{"nocar":false,"freqfly":false}},"sector3":{"value":1.69,"parms":{"nomeat":false,"muchmeat":false}},"sector4":{"value":3.45,"parms":{"nomoney":false,"muchmoney":false,"stock":false}},"sector5":{"value":0.84,"parms":{}},"sector6":{}},"location":{"district":4,"mult":6}}


