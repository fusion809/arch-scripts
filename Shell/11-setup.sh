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

# Install youtube-dl if missing
if ! [[ -f /usr/bin/youtube-dl ]]; then
    pacin youtube-dl
fi
