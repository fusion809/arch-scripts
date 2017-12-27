function fix-perms {
    sudo find /data -exec chown fusion809:wheel {} +
}
