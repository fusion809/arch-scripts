function subrm {
  git submodule deinit "$@" && rm -rf "$@"
  push "Rm submodule $@"
}
