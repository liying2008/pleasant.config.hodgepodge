#!/usr/bin/env bash


# 查询本机在互联网中的 IP
myip() {
  ip_str=$(curl -s wap.ip168.com/json.do?view=myipaddress)
  [[ $PLEASANT_DEBUG == 1 ]] && echo $ip_str
  ip_str=$(echo $ip_str | awk -F "center" '{print $2}')
  [[ $PLEASANT_DEBUG == 1 ]] && echo $ip_str
  ip_str=$(echo $ip_str | cut -d ">" -f2 | cut -d "<" -f1)
  echo $ip_str
}

# just for testing
# myip
