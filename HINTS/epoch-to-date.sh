enter only first 10 digits and remove last 3 from the epoch value

$ date -d@1489720496 
Fri Mar 17 03:14:56 UTC 2017


$ date "+%Y-%m-%d %H:%M" -d@1489720496
2017-03-17 03:14

