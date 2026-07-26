on run argv

    set targetUrl to item 1 of argv
    set searchquery to item 2 of argv

    tell application "safari"
    activate
    delay 3
    set currenttab to current tab of front window

    set current_url to (url of currenttab) as text

   set jsCode to "const searchInput = document.querySelector('input');"
   set jsCode to jsCode & "const searchButton = document.querySelector('.ytSearchboxComponentSearchButton');"
   set jsCode to jsCode & "searchInput.focus();"
   set jsCode to jsCode & "searchInput.value = '" & searchquery & "';"
   set jsCode to jsCode & "searchButton.click();"
   do JavaScript jsCode in currenttab
   delay 3
   set searchresult to "const firstresult = document.querySelector('ytd-video-renderer a#video-title');"
   set searchresult to searchresult & "firstresult.click();"
   do JavaScript searchresult in currenttab
   delay 3
   set fullscreencode to "const fullscreenbutton = document.querySelector('.ytp-fullscreen-button');"
   set fullscreencode to fullscreencode & "fullscreenbutton.click();"
   do JavaScript fullscreencode in currenttab
   
end tell

end run
