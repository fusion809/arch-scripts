function psize {
    pacman -Qi $1 | sed -n 's/Installed Size\s*:\s//p'
}
