# General Env vars {{
	set -g -x EDITOR vim

	set -g -x PTOOLSPATH /home/azaan/software/phalcon/vendor/phalcon/devtools

	set PATH /usr/bin/vendor_perl/ $PATH
# }}

# Helper functions {{

	function sf
		source ~/dev/external/dotfiles/fish/config.fish
	end	

	function fishrc
		subl3 ~/dev/external/dotfiles/fish/config.fish
	end

	function xinc
		xbacklight -inc 10
	end

	function xdec
		xbacklight -dec 10
	end

# }}

# Work {{


# }}
