export PS1='\[\e[36m\]\u@\h \[\e[1m\]\w\[\e[32m\]$(parse_git_branch)\[\e[36m\] \$ \[\e[m\]'

function parse_git_dirty {
  git diff-index --quiet --cached HEAD --ignore-submodules -- 2> /dev/null && git diff-files --quiet --ignore-submodules 2> /dev/null || echo ' *'
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \(\1$(parse_git_dirty)\)/"
}

export PATH="/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# For ack
export PATH="/Users/salbertson/bin:$PATH"

# For postgres
export PATH="/usr/local/pgsql/bin:$PATH"

export EDITOR="vim"

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
