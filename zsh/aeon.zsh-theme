function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '± ' && return
	echo '⚡ '
}

# zanshin.net/2011/08/12/oh-my-zsh
# Git sometimes goes into a detached head state. git_prompt_info doesn't
# return anything in this case. So wrap it in another function and check
# for an empty string.
function check_git_prompt_info() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		if [[ -z $(git_prompt_info) ]]; then
			echo "%{$fg_bold[red]%}:detached-head%{$reset_color%})"
		else
			echo "$(git_prompt_info)"
		fi
	fi
}

PROMPT='
%{$fg[green]%}%n%{$reset_color%}@%m %!| $(virtualenv_prompt_info) %{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%}
%{$fg_bold[red]%}$(prompt_char)%{$reset_color%} '

RPROMPT='$(check_git_prompt_info)  [%*]'

ZSH_THEME_GIT_PROMPT_PREFIX=":%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}(*)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}(?)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
