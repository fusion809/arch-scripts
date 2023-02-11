#!/bin/zsh
for i in ~/.local/share/*
do
	if [[ -L $i ]]; then
		rm "$i"
	else
		mv "$i" /data/.local/share
	fi
done

rm -rf ~/.local/share
ln -sf /data/.local/share ~/.local/
