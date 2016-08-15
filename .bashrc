# ~/sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# OPAM configuration
. /home/scott/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export VISUAL=vim
export EDITOR="$VISUAL"

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,vars}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export TERMCMD='gnome-terminal'
export TERMINAL="$TERMCMD"
export CPATH=':/usr/lib/openmpi/include/'

export PATH="$HOME/bin:$PATH"

# cargo-extras
export PATH="/home/scott/.multirust/toolchains/beta/cargo/bin:$PATH"

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s "$BASE16_SHELL" ]] && source "$BASE16_SHELL"
