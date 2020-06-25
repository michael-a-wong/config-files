#!/usr/bin/env expect

set host [lindex $argv 0]
spawn ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@$host
#sleep 1
expect {
    "Password*" {send "Embe1mpls\r"}
#    "*.ssh*" {
#        expect "~$"
#        send "rm /homes/wongm/.ssh/known_hosts\r"
#        sleep 1
#        expect "~$" 
#        spawn ssh root@$host
#        expect {
#            "(yes/no)?" {
#                send "yes\r"
#                expect "Password*" {send "Embe1mpls\r"}
#            }
#            "Password*" {send "Embe1mpls\r"}
#        }
#        
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
