# Check if command exists
function comc {
  which $1 >/dev/null 2>&1
}

alias comex=comc