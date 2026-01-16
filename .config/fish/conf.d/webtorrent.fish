function wtrr --description 'Download and Play WebTorrent in VLC'
    set MAGNET_LINK $arg[1]
    webtorrent download -o /Users/naokiiida/Movies/webtorrent/ --vlc -i "$MAGNET_LINK"
end
