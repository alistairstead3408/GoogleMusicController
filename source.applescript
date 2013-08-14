on run
	tell application "Safari"
		--Variables
		set found to false
		set windowCount to number of windows
		--Repeat for Every Window
		repeat with x from 1 to windowCount
			set tabCount to number of tabs in window x
			--Repeat for Every Tab in Current Window
			repeat with y from 1 to tabCount
				--Get Tab Name & URL
				set tabName to name of tab y of window x
				if ("My Library - Google Play" is in tabName) then
					
					tell window x to activate
					tell window x to set current tab to tab y
					do JavaScript "SJBpost('playPause');" in document 1
					--set the current tab to tab y
					set found to true
				end if
			end repeat
		end repeat
		if (found = false) then
			set myTab to make new tab at end of tabs of window 1
			set URL of myTab to "http://google.com/music"
		end if
		activate
	end tell
end run


