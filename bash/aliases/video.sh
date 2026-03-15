alias .video.crop.1080p='ffmpegcrop'

function ffmpegcrop() {
  if [ -z "$1" ]
  then
    echo "Supply an input file name (with extension)"
    return 1
  fi

  if [ -z "$2" ]
  then
    outputname="${1%.*}-1920x1080.mp4"
  else
    outputname=$2
  fi
  echo "Output file name: $outputname"

  ffmpeg -i "$1" \
    -filter:v "crop=1920:1080:198:0" \
    -c:v libx264 \
    -profile:v high \
    -level 4.2 \
    -preset slow \
    -crf 17 \
    -pix_fmt yuv420p \
    -movflags +faststart \
    -c:a copy \
    "$outputname"
}