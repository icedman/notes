for i in *.mp4; 
do
  ffmpeg -y -i "$i" -vf "[in]scale=iw*min(1080/iw\,720/ih):ih*min(1080/iw\,720/ih)[scaled]; [scaled]pad=1080:720:(1080-iw*min(1080/iw\,720/ih))/2:(720-ih*min(1080/iw\,720/ih))/2[padded]; [padded]setsar=1:1[out]" -c:v libx264 -c:a copy "$i~_shrink.mp4"
done