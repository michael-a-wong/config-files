#!/usr/bin/env expect

#set host [lindex $argv 0]
spawn ssh root@
#sleep 1
expect {
    "Password*" {send "Embe1mpls\r"}
#    "*WARNING*" {send "rm /homes/wongm/.ssh/known_hosts\r"
#                      expect "~$"
#                      spawn ssh root@$host
#                      expect "(yes/no)?"
#                      send "yes\r"
#                          expect "/#"
#    }
    "(yes/no)?" {
        send "yes\r";
        expect "Password*" {send "Embe1mpls\r"}
    }
    "login:" {
       exit 1
    }
    "#"

}

expect "~#"
interact
