#!/bin/env zsh

#####  #### #   #
   #  #     #   #
  #    ###  #####
 #        # #   #
##### ####  #   #

#  run  configs  #

alias vi='vim'

alias c8='cd ../../../../../../../../'
alias c7='cd ../../../../../../../'
alias c6='cd ../../../../../../'
alias c5='cd ../../../../../'
alias c4='cd ../../../../'
alias c3='cd ../../../'
alias c2='cd ../../'

alias l='ls -lrtG'
alias ls='ls -G'
alias grep="grep --color=auto"  # color grep - highlight desired sequence.
alias h='hostname'

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'


# cd into the old directory
alias cdBack='cd "$OLDPWD"'

## Juniper related ###

alias image='cd packages/ptx/ptx-chassis/image/obj-native64/install/ptx/; cd packages/ptx/ptx-chassis/image/obj-re-64b/install/ptx/dbg'

#alias POD
alias cdvmm='cd /vmm/data/user_disks/wongm'
alias sv8='ssh sv8-pod2-vmm'
alias pod2='ssh -t sv8-pod2-vmm "cd /vmm/data/user_disks/wongm/pod2; bash"'
alias pod3='ssh -t sv8-pod3-vmm "cd /vmm/data/user_disks/wongm/pod3; bash"'
alias pod4='ssh -t sv8-pod4-vmm "cd /vmm/data/user_disks/wongm/pod4; bash"'
alias pod13='ssh q-pod13-vmm'
alias pod5='ssh -t q-pod05-vmm "cd /vmm/data/user_disks/wongm/pod05; bash"'
alias pod8='ssh -t q-pod08-vmm "cd /vmm/data/user_disks/wongm/pod08; bash"'
alias tt='ssh ttsv-shell101'


alias cdTmp='ssh -t sv8-pod2-vmm "cd tmp; bash"'

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
scpPtxFixed() {
   scp ptx-fixed.iso root@$1:/var/tmp
}
scpPtxFixedDbg() {
   scp ptx-fixed-dbg.iso root@$1:/var/tmp
}

# Copy file with a progress bar
cpl()
{
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
    | awk '{
    count += $NF
    if (count % 10 == 0) {
        percent = count / total_size * 100
        printf "%3d%% [", percent
        for (i=0;i<=percent;i++)
            printf "="
            printf ">"
                for (i=percent;i<100;i++)
                    printf " "
                    printf "]\r"
                }
        }
    END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

extract () {
        for archive in $*; do
                if [ -f $archive ] ; then
                        case $archive in
                                *.tar.bz2)   tar xvjf $archive    ;;
                                *.tar.gz)    tar xvzf $archive    ;;
                                *.bz2)       bunzip2 $archive     ;;
                                *.rar)       rar x $archive       ;;
                                *.gz)        gunzip $archive      ;;
                                *.tar)       tar xvf $archive     ;;
                                *.tbz2)      tar xvjf $archive    ;;
                                *.tgz)       tar xvzf $archive    ;;
                                *.zip)       unzip $archive       ;;
                                *.Z)         uncompress $archive  ;;
                                *.7z)        7z x $archive        ;;
                                *)           echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}








