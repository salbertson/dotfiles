export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/.rvm/bin'
export EDITOR=/usr/bin/vim

source ~/.bash/aliases

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

function parse_git_dirty {
  git diff-index --quiet --cached HEAD --ignore-submodules -- 2> /dev/null && git diff-files --quiet --ignore-submodules 2> /dev/null || echo ' *'
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \(\1$(parse_git_dirty)\)/"
}

export PS1='\[\e[36m\]\u:\w\[\e[32m\]$(parse_git_branch)\[\e[36m\] \$ \[\e[m\]'

# RVM
[[ -s '/Users/salbertson/.rvm/scripts/rvm' ]] && source '/Users/salbertson/.rvm/scripts/rvm'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
