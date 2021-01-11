#! /bin/sh
curl -v -XPOST -H "Content-Type: application/json" elasticsearch.lan:80/speed/_doc -d "$(/speedtest -f json)"