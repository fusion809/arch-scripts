# Git shrink
# Taken from http://stackoverflow.com/a/2116892/1876983
function gitsh {
  git reflog expire --all --expire=now
  git gc --prune=now --aggressive
}

# Estimate the size of the current repo
# Taken from http://stackoverflow.com/a/16163608/1876983
function gitsize {
  git gc
  git count-objects -vH
}

function gitssi {
  gitsh && gitsize
}

# Switch to SSH
function gitsw {
  # $1 is the username of the repo
  git remote rm origin
  git remote rm upstream
	CWD=${PWD##*/}
	GWD="${CWD#.}"
	if [[ -n "$1" ]]; then
	  git remote add origin git@github.com:$1/$GWD.git
	  git remote add upstream git@github.com:$1/$GWD.git
	else
	  git remote add origin git@github.com:fusion809/$GWD.git
	  git remote add upstream git@github.com:fusion809/$GWD.git
	fi
}

alias SSH=gitsw
alias gitssh=gitsw
alias gits=gitsw
