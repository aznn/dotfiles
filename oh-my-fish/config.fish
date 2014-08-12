# Vars {{ -----------------------------------------------------------------------------------------
    set -x EDITOR subl3

    # used by rhythmbox-remote
    set -x SONG_LIBRARY '/home/azaan/Delta/Media Library/Music'
# }}

# Autorun {{ --------------------------------------------------------------------------------------
    # setup palm detection
    synclient PalmDetect=1 PalmMinWidth=5 PalmMinZ=20
# }}

# General Helpers {{ ------------------------------------------------------------------------------

    # helpers to open common config files


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

# }}

# Rhythmbox {{ -----------------------------------------------------------------------------------

    function song
        # helper to run rhythmbox script
        python2.7 ~/dev/external/Rhythmbox-Remote/rhythmRemote.py $argv
    end

    function p
        # play the song given as args
        song play $argv
    end

# }}

# Git {{ -----------------------------------------------------------------------------------------

# }}
