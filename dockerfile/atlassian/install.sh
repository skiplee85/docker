#! /usr/bin/expect
set timeout -1
set CMD [lindex $argv 0]

spawn $CMD
expect "o, Enter"
send "o\n"

expect "Express Install"
send "1\n"

expect "i, Enter"
send "i\n"

expect "Finishing installation ..."
send "\n"

interact