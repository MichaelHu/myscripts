#!/usr/bin/expect 

# @desc: login relay01 and relay to fe2
# @usage: ./relaytofe2 TOKEN

set timeout 30 

set token 4321[lrange $argv 0 0]
spawn ssh hudamin@relay01.258i.com

expect -re ".*PASSCODE:"
send "$token\r" 

expect -re ".*-258i-ssl\$"
send "ssh work@fe2-258i.com\r" 

expect -re ".*password:.*"
send "1234567\r" 

interact
