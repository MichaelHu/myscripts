#!/usr/bin/expect 

# @author: hudamin@258i.com
# @reference: http://xuhuandh.iteye.com/blog/947039
# @reference: http://tomo.im/261
# @require: ~/.ssh/config: ControlPath

set timeout 30 

set username [lrange $argv 0 0]

if { $username == "" } { 
    spawn ssh relay01.258i.com 
} else {
    spawn ssh $username@relay01.258i.com 
}

expect -re ".*ssl.*" 
send "ssh work@fe2-258i.com\r" 
expect -re ".*password:" 
send "1234567\r" 
interact 

