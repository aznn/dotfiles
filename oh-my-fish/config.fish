# Vars {{ -----------------------------------------------------------------------------------------
    set -x EDITOR vim

    # used by rhythmbox-remote
    set -x SONG_LIBRARY '/home/azaan/Delta/Media Library/Music'

    # ask virtualfish to use workon and deactivate
    set -x VIRTUALFISH_COMPAT_ALIASES 1

    # stop python writing pyc files
    set -x PYTHONDONTWRITEBYTECODE 1

    # add composer binaries to path
    set -gx PATH /home/azaan/.composer/vendor/bin $PATH

    # add facebook file picker to path
    set -gx PATH /home/azaan/Software/PathPicker $PATH

    # add ruby gems to path
    set -gx PATH /home/azaan/.gem/ruby/2.1.0/bin $PATH

    # Add popcorn time to path
    set -gx PATH /home/azaan/Downloads/Popcorn-Time-0.3.7.2-Linux64 $PATH
# }}

# Autorun {{ --------------------------------------------------------------------------------------
    # setup palm detection
    synclient PalmDetect=1 PalmMinWidth=8 PalmMinZ=20
# }}

# Program Configs {{ ------------------------------------------------------------------------------

    function fuck
        eval (thefuck (history | head -n1))
    end

# }}

# General Helpers {{ ------------------------------------------------------------------------------

    # helpers to open common config files
    alias fishrc "subl3 ~/dotfiles/oh-my-fish/config.fish"
    alias awesomerc "subl3 ~/.config/awesome/rc.lua"

    # aliases of programs for ease
    alias subl subl3
    alias py2 python2.7
    alias chrome google-chrome-beta

    # package management helpers
    alias pac "sudo pacman -S"
    alias spi "sudo pip install"
    alias sp2i "sudo pip2 install"

    function sf
        # source the config file
        source ~/.config/fish/config.fish
    end

    function sudo!!
        # rerun last command with sudo
        eval sudo $history[1] $argv
    end

    function rmouse
        # setup config for razer mouse
        xinput --set-prop 'Razer Razer DeathAdder' 'Device Accel Constant Deceleration' 7
    end

    function clogin
        # login to christ wifi
        curl -X POST -H Content-Type:application/x-www-form-urlencoded -d "username=1158102&mode=191&password=$CHRIST_PASS" http://192.168.100.100:8090/login.xml
    end

    function clogine
        clogin
        sleep 0.5
        exit
    end

    function cwd
        # copy current working dir to clipboard
        pwd | tr -d '\n' | xsel -b
    end

    function copy
        # copies the text piped in
        xsel -b
    end

    function mdir
        # creates a directory and cd to it
        mkdir $argv
        cd $argv[-1]
    end

    function pserver
        # starts a python server in current folder
        python2 -m SimpleHTTPServer $argv
    end

    function vol
        # usage: vol 30%
        amixer set Master $argv
    end

    # helper awk commands to print specified column
    alias awk1 "awk '{print $1}'"
    alias awk2 "awk '{print $2}'"
    alias awk3 "awk '{print $3}'"

# }}

# Rhythmbox {{ -----------------------------------------------------------------------------------

    function unmute
        amixer -d set Master unmute
    end

    function song
        # helper to run rhythmbox script
        python2.7 ~/dev/external/Rhythmbox-Remote/rhythmRemote.py $argv
    end

    function pe
        song play $argv
        sleep 0.5
        exit
    end

    alias p "song play"
    alias sw "song what"
    alias sn "song next"
    alias sp "song prev"
    alias sr "song rate"

    # move 5 rated songs to this folder
    set -x RHYTHMBOX_REMOTE_5_FOLDER /home/azaan/Music/E

# }}

# Git {{ -----------------------------------------------------------------------------------------

    alias ga "git add ."
    alias gdq "git diff"
    alias gs "git status"
    alias gcm "git commit -m"
    alias gcam "git commit -am"
    alias gc "git commit --verbose"
    alias gph "git push heroku master"
    alias gpo "git push origin master"
    alias gca "git commit --verbose -a"
    alias gcamend "git commit --amend --verbose"
    alias gl "git log --graph --decorate --all --stat --date=relative"
    alias glo "git log --oneline --decorate --graph --abbrev-commit --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) [%C(blue)%an%C(reset)] - %C(white)%s%C(reset)'"

# }}
