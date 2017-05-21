Automator Workflows for photo management
========================================
macOS Automator workflows interfacing bash scripts as front-end of
[ExifTool](http://owl.phy.queensu.ca/~phil/exiftool/)
for reading, writing, and manipulating image files.

Write lens meta informations
----------------------------
Use `exiftool` to add model, aperture, and focal length
when such lens informations are not stored by the camera
(i.e. manual lens without chip).
```
exifAF50mmUpdate
exifAI20mmUpdate
exifK105mmUpdate
```

Add IPTC meta informations
--------------------------
Use `exiftool` to add copyrights information.
```
exifCopyRightsUpdate
```

File naming
-----------
Use `exiftool` to rename with DateTimeOriginal and short description (optional)
the supplied files.
```
exifDateTimeOriginal
```

Required
--------
[ExifTool](http://owl.phy.queensu.ca/~phil/exiftool/) by Phil Harvey.

The beer-ware license
=====================
As long as you retain this notice you can do whatever you want with this stuff.
If we meet some day, and you think this stuff is worth it, you can buy me a beer
in return.
