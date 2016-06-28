# reload
function sysdr {
  sudo systemctl daemon-reload
}

# enable
function syse {
  sudo systemctl enable "$@"
}

# restart
function sysr {
  sudo systemctl restart "$@"
}
