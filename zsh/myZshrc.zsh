#!/bin/env zsh

#####  #### #   #
   #  #     #   #
  #    ###  #####
 #        # #   #
##### ####  #   #

#  run  configs  #

unset zle_bracketed_paste

alias vi='vim'

alias c8='cd ../../../../../../../../'
alias c7='cd ../../../../../../../'
alias c6='cd ../../../../../../'
alias c5='cd ../../../../../'
alias c4='cd ../../../../'
alias c3='cd ../../../'
alias c2='cd ../../'

#alias l='ls -lrtG'
alias l='ls -lah'
alias ls='ls -G'
alias grep="grep --color=auto"  # color grep - highlight desired sequence.
alias h='hostname'
alias g=git
# git config --global alias.s status
# git config --global alias.d diff
# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.last "log -1 HEAD"
# git config --global alias.cane "commit --amend --no-edit"
# git config --global alias.pr "pull --rebase"
# git config --global alias.lo "log --oneline -n 10"

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
# shopt -s histappend
PROMPT_COMMAND='history -a'


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


