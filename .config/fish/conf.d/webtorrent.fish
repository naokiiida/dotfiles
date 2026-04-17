function wtrrv --description 'Download and Play WebTorrent in VLC'
    set MAGNET_LINK $argv[1]
    webtorrent download -o /Users/naokiiida/Movies/webtorrent/ --vlc -i "$MAGNET_LINK"
end
function wtrr --description 'Download and Play WebTorrent in mpv'
    set MAGNET_LINK $argv[1]
    webtorrent download -o /Users/naokiiida/Movies/webtorrent/ --mpv -i "$MAGNET_LINK"
end
function wtrri --description 'Download and Play WebTorrent in IINA'
    set MAGNET_LINK $argv[1]
    webtorrent download -o /Users/naokiiida/Movies/webtorrent/ --iina -i "$MAGNET_LINK"
end
