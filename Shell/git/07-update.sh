function gitup {
  git pull upstream $(git rev-parse --abbrev-ref HEAD)
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}
