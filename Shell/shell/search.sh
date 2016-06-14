# Search files for patterns using grep
function grsh {
  grep --include="*.sh" -R "$1" $SHL
}
