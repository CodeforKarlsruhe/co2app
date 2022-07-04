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


## App "Bunte Nacht"

Version used at [Bunte Nacht, 1.7.2022](https://ok-lab-karlsruhe.de/projekte/bunte-nacht/)
![](co2app.png)

With **SIMPLE** backend, see [rest.php](public/rest.php)

Cooperates with *co2dash*

## Issues
Server for "Bunte Nacht" is Debian 9 (old old old). There are some issues with PHP and Mysql versions.
*Districts*-table seems to be non-UTF8, which breaks json_encode on newer versions but not on this one.
 However, newer flags like *JSON_INVALID_UTF8_SUBSTITUTE* don't work here ...

