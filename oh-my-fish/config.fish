# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme zish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
set fish_custom $HOME/dev/external/dotfiles/oh-my-fish

. $fish_custom/config.fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# hide greeting
set fish_greeting ""

# show archey screen
clear
archey
