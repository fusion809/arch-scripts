function eapp {
	wget -cqO- https://download.enlightenment.org/rel/apps/$1/$1-$2.tar.xz | tar -xJ
	cd $1-$2
	trin
	cd ..
}
