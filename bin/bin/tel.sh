#!/usr/bin/expect -f

spawn telnet $argv
expect "login"
send "regress\r"
expect "Password"
send "MaRtInI\r"
expect "#"
send "su   -\r"
expect "Password"
send "Embe1mpls\r"
expect "#"
interact

