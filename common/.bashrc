alias vi='vim'

alias c8='cd ../../../../../../../../'
alias c7='cd ../../../../../../../'
alias c6='cd ../../../../../../'
alias c5='cd ../../../../../'
alias c4='cd ../../../../'
alias c3='cd ../../../'
alias c2='cd ../../'

alias l='ls -lrt --color=auto'
alias ls='ls --color=auto'


## Juniper related ###

alias image='cd packages/ptx/ptx-chassis/image/obj-native64/install/ptx/; cd packages/ptx/ptx-chassis/image/obj-re-64b/install/ptx/dbg'

#alias POD
alias cdvmm='cd /vmm/data/user_disks/wongm'
alias sv8='ssh sv8-pod2-vmm'
alias pod2='ssh -t sv8-pod2-vmm "cd /vmm/data/user_disks/wongm/pod2; bash"'
alias pod3='ssh -t sv8-pod3-vmm "cd /vmm/data/user_disks/wongm/pod3; bash"'
alias pod13='ssh q-pod13-vmm'
alias pod5='ssh -t q-pod05-vmm "cd /vmm/data/user_disks/wongm/pod05; bash"'
alias pod8='ssh -t q-pod08-vmm "cd /vmm/data/user_disks/wongm/pod08; bash"'
alias tt='ssh ttsv-shell101'

alias grep="grep --color=auto"  # color grep - highlight desired sequence.

alias scp2Tmp='scpTmp'
alias cdTmp='ssh -t sv8-pod2-vmm "cd tmp; bash"'

alias scpPtx='scpPtx'
alias scpPtxDbg='scpPtxDbg'
alias cdImageDbg='cd packages/ptx/ptx-chassis/image/obj-native64/install/ptx/; cd packages/ptx/ptx-chassis/image/obj-re-64b/install/ptx/dbg'
alias cdImage='cd packages/ptx/ptx-chassis/image/obj-re-64b/install/ptx/'
alias sbScapa='baas build -b "sb make DEFAULT_COMPONENTS=ptx-chassis-image DEBUG=0" -x'
alias sbScapaDbg='baas build -b "sb make DEFAULT_COMPONENTS=ptx-chassis-image" -x'

scpTmp() {
   scp $1 sv8-pod2-vmm:~/tmp
}
scpPtx() {
   scp ptx.iso root@$1:/var/tmp
}
scpPtxDbg() {
   scp ptx-dbg.iso root@$1:/var/tmp
}

