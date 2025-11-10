function hyprpm_update {
	if `which hyprland &> /dev/null`; then
		hypVer=$(hyprland --version | head -n 1 | cut -d ' ' -f 2)
		oldVer=$(cat $HOME/.cache/hyprland-version)
		if [[ $hypVer != $oldVer ]]; then
			hyprpm update
			echo $hypVer > $HOME/.cache/hyprland-version
		fi
	fi
}
