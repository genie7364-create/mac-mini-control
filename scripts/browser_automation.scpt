on run argv

    set targetUrl to item 1 of argv
    set genre to item 2 of argv

    tell application "safari"
    activate

    set currenttab to current tab of front window

    set current_url to (url of currenttab) as text
    display dialog current_url

    do javascript "document.title" in currenttab
    set pagetitle to do javascript "document.title" in currenttab
    display dialog pagetitle

end tell

end run