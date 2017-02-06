# Install atom if missing
if ! [[ -f /usr/bin/atom ]]; then
	pacin atom
fi

# Install GNU Octave if missing
if ! [[ -f /usr/bin/octave ]]; then
	pacin octave
fi

# Install hub if missing
if ! [[ -f /usr/bin/hub ]]; then
	pacin hub
fi

# Install xclip if missing
if ! [[ -f /usr/bin/xclip ]]; then
	pacin xclip
fi
