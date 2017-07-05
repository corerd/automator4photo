Moving pictures to dated folders
See: http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=6170.0
${EXIF} -o . '-Directory<FileModifyDate' '-Directory<DateTimeOriginal' -d $TARGETDIR/%Y/%m_%B/%Y.%m.%d -r $SOURCEDIR

Get lens model, focal length and aperture from pictures:
exiftool -a -G1 -s -exif:lens* -composite:lens* -exif:focal* -composite:focal* -FNumber -aperture DSC00160.ARW


GOOGLE PHOTOS OUT OF ORDER ISSUE
================================
When photos are uploaded to Google Photos, Google stores them
with the Windows "File Creation" instead of "File Modification" Date/Time,
so that the photos will appear out of order.

Anyhow, if ExifIFD is properly filled in, then photos appear in the correct order.

Set ExifIFD  DateTimeOriginal and CreateDate tags
from File Modification Date/Time preserving date/time of original file:
iftool -P '-DateTimeOriginal<FileModifyDate' '-CreateDate<FileModifyDate' IMG-20150421-WA0000.jpg

