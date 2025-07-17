# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# See bash(1) for more options
HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='ls -v -F --group-directories-first --time-style=long-iso --color=auto'
alias ll='ls -lah'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "$HOME/.cargo/env" ]
then
    . "$HOME/.cargo/env"
fi

PATH="$PATH:$HOME/.local/bin"

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a"

# apt install fzf
if [ -f "/usr/share/doc/fzf/examples/key-bindings.bash" ]
then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# https://github.com/riobard/bash-powerline
if [ -f "$HOME/.bash-powerline.sh" ]
then
    source "$HOME/.bash-powerline.sh"
fi

# https://github.com/nordtheme/dircolors/releases
if [ -f "$HOME/.dircolors.nord" ]
then
    eval `dircolors $HOME/.dircolors.nord`
fi

if [ -f "/usr/bin/fdfind" ]
then
    alias fd=/usr/bin/fdfind
fi

# bat / batcat (apt install batcat)
if [ -f "/usr/bin/batcat" ]
then
    alias bat=/usr/bin/batcat
fi

# zoxide (apt install zoxide)
if command -v zoxide &> /dev/null
then
    eval "$(zoxide init bash)"
fi

# https://github.com/antonmedv/walk
function lk() {
    cd "$(walk --icons "$@")"
}

# When doing Yocto Project stuff, this can be used to
# know if have a bitbake environment currently sourced in.
function is_bitbake() {
    if [ -n "$BBPATH" ]
    then
        echo "Is bitbake: $BBPATH"
    fi
}

alias ccmake='ccmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON'
alias create_deb_from_make_install='fakeroot checkinstall --install=no --fstrans=yes -D --pkglicense CLOSED --nodoc --exclude /home'

umedit() {
    mkdir -p "$HOME/notes"
    vim "$HOME/notes/$1.md"
}
um() {
    p="$HOME/notes/$1.md"
    if command -v bat &> /dev/null
    then
        bat "$p"
    else
        cat "$p"
    fi
}

redstderr()(set -o pipefail;"$@" 2> >(sed $'s,.*,\e[31m&\e[m,'>&2))
export -f redstderr

if command -v vim &> /dev/null
then
    export EDITOR=vim
    alias v="vim"
fi

if command -v ripgrep &> /dev/null
then
    alias rg="ripgrep --smart-case"
elif command -v rg &> /dev/null
then
    alias rg="rg --smart-case"
fi

alias m="make -j$(nproc)"
alias valgrinddd='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose'

# PUT DEVICE SPECIFIC ADDITIONS BELOW THIS LINE!
