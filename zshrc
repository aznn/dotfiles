# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aeon-theme"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found sublime autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

#-----------------------------------------------------
#-----------------------------------------------------
#-----------------------------------------------------

#======path settings
# http://unix.stackexchange.com/questions/62579/is-there-a-way-to-add-a-directory-to-my-path-in-zsh-only-if-its-not-already-pre
# ensure path array is unique
typeset -U path

# add to front
path=(~/dev/install/android-sdk-linux/platform-tools "$path[@]")
path=(~/dev/bin "$path[@]")

#======custom functions

# sum 1 2 3 4
function sum; {
    sum=0
    for var in "$@"; do
        sum=$((sum + var ))
    done
    echo $sum
}

# average 1 2 3 4
function average; {
    echo $(( $(sum $@) / ($# + 0.0) ))
}

# chrome = opens chrome
function chrome; {
    google-chrome $* > /dev/null 2>&1 &
    disown
}

# sublime foldername
function sublime; {
    nohup "/home/azaan/Software/Sublime Text 2/sublime_text" $* >/dev/null 2>&1 &
}

# domath "sin(2)"
function domath; {
    zmodload zsh/mathfunc
    echo $(( $* ))
}

# URL encode something and print it.
function url-encode; {
    setopt extendedglob
    echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# google hello world
function google; {
    chrome "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

# suspendat 2:40
function suspendat; {
    pmi action suspend | at $*
}

#======normal alias

# music settings
export PLAYER=rythmbox
alias rbox="rhythmbox"
alias song="/home/azaan/dev/projects/RhythmRemote/rhythmRemote.py"
alias sw="song what"
alias sn="song next"
alias sp="song prev"
alias sr="song rate"
alias p="song play"

# open apps
alias chromei="chrome -incognito"
alias openw="nautilus ."
alias termx="gnome-terminal --geometry=90x24+100+50"
alias termy="gnome-terminal --geometry=90x24+500+260"
alias clem="nohup clementine >/dev/null 2>&1 &"
alias burp="nohup java -jar ~/dev/bin/burpsuite_free_v1.5.jar > /dev/null 2>&1 &"

# shell helpers
alias sz="source ~/.zshrc"
alias zshrc="gvim ~/.zshrc"
alias vimrc="gvim ~/.vimrc"
alias cwd="pwd | tr -d '\n' | xsel -b" #copy current working dir
alias pgoogle="ping www.google.com"
alias l="ls -lh"
alias netlog="sudo nethogs"

alias mv="mv -i" #comfirm on overwrite
alias rm="rm -i"
alias cp="cp -i"

alias pyinstall="sudo python setup.py install"

# xampp server
alias server="/opt/lampp/lampp"

# package management
alias sagi="sudo apt-get install"
alias sagu="sudo apt-get update"
alias saar="sudo add-apt-repository"

#======suffix alias (if a file with the suffix is run)
alias -s html=sublime
alias -s css=sublime
alias -s c=sublime
alias -s js=sublime
alias -s py=python

#======global alias (substitute inside another command)
alias -g NUL="> /dev/null 2>&1"

#======zsh options

# enable !history commands to execute automatically
setopt no_hist_verify

setopt AUTO_CD

# 10 second wait if you do something that will delete everything.  :)
setopt RM_STAR_WAIT