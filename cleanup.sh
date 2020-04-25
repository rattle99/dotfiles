#!/bin/zsh

TORRENTS="$HOME/Downloads/Torrents"
VID="$HOME/Downloads/Vids"
IMG="$HOME/Downloads/Img"
ZIP="$HOME/Downloads/Zip"
DEB="$HOME/Downloads/Deb"
DOCS="$HOME/Downloads/Docs"

[ ! -d "$TORRENTS" ] && { echo "Making folder "$TORRENTS""; mkdir -p "$TORRENTS";}
echo "Moving torrent files to "$TORRENTS""
mv *torrent "$TORRENTS"
echo "Done"

[ ! -d "$VID" ] && { echo "Making folder "$VID""; mkdir -p "$VID";}
echo "Moving video files to "$VID""
mv *mp4 "$VID"
mv *mkv "$VID"
echo "Done"

[ ! -d "$IMG" ] && { echo "Making folder "$IMG""; mkdir -p "$IMG";}
echo "Moving image files to "$IMG""
mv *png "$IMG"
mv *jpeg* "$IMG"
mv *jpg "$IMG"
mv *gif "$IMG"
echo "Done"

[ ! -d "$ZIP" ] && { echo "Making folder "$ZIP""; mkdir -p "$ZIP";}
echo "Moving zip files to "$ZIP""
mv *zip "$ZIP"
mv *gz "$ZIP"
mv *rar "$ZIP"
mv *xz "$ZIP"
mv *tbz "$ZIP"
echo "Done"

[ ! -d "$DEB" ] && { echo "Making folder "$DEB""; mkdir -p "$DEB";}
echo "Moving .deb files to "$DEB""
mv *deb "$DEB"
echo "Done"

[ ! -d "$DOCS" ] && { echo "Making folder "$DOCS""; mkdir -p "$DOCS";}
echo "Moving documents to "$DOCS""
mv *pdf "$DOCS"
mv *docx "$DOCS"
mv *ppt "$DOCS"
echo "Done"
