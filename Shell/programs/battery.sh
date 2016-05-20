function battery {
  upower -i $(upower -e | grep 'BAT') | grep -E "to\ full|percentage" | sed "s/\s*percentage:\s*/percentage: /g"
}
