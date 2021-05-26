#!/usr/bin/expect --
set UPLOADADR ./hosts.txt
set FID [open ${UPLOADADR} r]

while { [gets $FID line] >= 0 } {
        set IP [lindex $line 0]
        spawn ssh root@$IP
        expect {
    	#"password" {send "mino123!@#\r";}
    	"yes/no" {send "yes\r";exp_continue}
    	"root" {send "exit\n";exp_continue}
		}
}