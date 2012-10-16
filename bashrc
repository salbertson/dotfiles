PATH=/usr/local/bin:/usr/local/sbin:$PATH # Make sure programs installed with brew get used first
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function parse_git_dirty {
  git diff-index --quiet --cached HEAD --ignore-submodules -- 2> /dev/null && git diff-files --quiet --ignore-submodules 2> /dev/null || echo ' *'
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \(\1$(parse_git_dirty)\)/"
}

export PS1='\[\e[36m\]\u@\h \[\e[1m\]\w\[\e[32m\]$(parse_git_branch)\[\e[36m\] \$ \[\e[m\]'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
