Moving pictures to dated folders
See: http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=6170.0
${EXIF} -o . '-Directory<FileModifyDate' '-Directory<DateTimeOriginal' -d $TARGETDIR/%Y/%m_%B/%Y.%m.%d -r $SOURCEDIR

Get lens model, focal length and aperture from pictures:
exiftool -a -G1 -s -exif:lens* -composite:lens* -exif:focal* -composite:focal* -FNumber -aperture DSC00160.ARW
