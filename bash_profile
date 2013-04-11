source /etc/bash_completion.d/mercurial.sh

hg_ps1() {
        #hg prompt " ({{branch}}{ r{rev}}{ <{bookmark}>}{ [{tags|quiet}]}{status|modified}{status|unknown}{update})" 2> /dev/null
        hg prompt " ({{branch}}{ <{bookmark}>}{ [{tags|quiet}]}{status|modified}{status|unknown}{update})" 2> /dev/null
}

export PS1="[\u@\h \W]\$(hg_ps1) \$ "

export EDITOR=vim

# function to set title
function wtitle {
 if [ "$TERM" == "xterm" ] ; then
  # Remove the old title string in the PS1, if one is already set.
  PS1=`echo $PS1 | sed -r 's/^\\\\\[.+\\\\\]//g'`
  export PS1="\[\033]0;$1 - \u@\h:\w\007\]$PS1 "
 fi
}

wtitle PuTTY
export PATH=$PATH:/opt/ss-arcanist/arcanist/bin/:/opt/node/bin/
export PATH=$PATH:/opt/ss-arcanist/arcanist/bin/:/opt/node/bin/
