#!/bin/sh

var1=$(curl -X 'GET' \
  'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=USD' \
  -H 'accept: application/json'| jq '.bitcoin.usd')

var2=$(curl -X 'GET' \
  'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=USD' \
  -H 'accept: application/json'| jq '.ethereum.usd')

quote=$(LANG=C printf "$%.2f $%.2f" "$var1" "$var2")

echo "test $quote"
