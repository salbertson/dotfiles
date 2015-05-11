export PATH=./bin:/usr/local/bin:/usr/local/heroku/bin:$PATH
export EDITOR=/usr/local/bin/vim

function parse_git_dirty {
  git diff-index --quiet --cached HEAD --ignore-submodules -- 2> /dev/null && git diff-files --quiet --ignore-submodules 2> /dev/null || echo ' *'
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \(\1$(parse_git_dirty)\)/"
}

export PS1='\[\e[36m\]\u:\w\[\e[32m\]$(parse_git_branch)\[\e[36m\] \$ \[\e[m\]'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.bash/aliases
