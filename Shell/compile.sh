function atrin {
	./autogen.sh --prefix=/usr && make && sudo make install
}

function trin {
	./configure --prefix=/usr && make && sudo make install
}
