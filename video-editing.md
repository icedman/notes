# obs-studio

screen recording with pipewire

requires:
qt6
pipewire
xdg-desktop-portal

# shotcut

video editing

# ffmpeg

## crop

ffmpeg -i 2023-04-30\ 09-10-43.mp4 -filter:v "crop=360:218:34:90" out.mp4

## mp4 to gif

ffmpeg -ss 16 -t 8 -i out.mp4 \
    -vf "fps=10,scale=500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 output.gif
