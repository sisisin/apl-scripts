on run argv
	tell application "iTerm"
		activate
		
		tell current terminal
			set dir to item 1 of argv
			set cdToDev to "cd ~/dev/" & dir
			set nodemon to "cd dest"
			set nodemon2 to "nodemon --debug ./bin/www.js"
			set nodeinspector to "node-inspector --web-port=3001"
			set watch to "npm run watch"
			
			launch session "dev"
			
			tell the last session to write text cdToDev
			tell the last session to write text nodemon
			tell the last session to write text nodemon2
			
			tell i term application "System Events" to keystroke "D" using command down
			tell the last session to write text cdToDev
			tell the last session to write text nodeinspector
			
			tell i term application "System Events" to keystroke "t" using command down
			tell the last session to write text cdToDev
			tell the last session to write text watch
			
		end tell
	end tell
	
	tell application "Google Chrome"
		activate
		open location "http://localhost:3000/"
		
		tell window 1 to make new tab with properties {URL:"http://127.0.0.1:3001/?ws=127.0.0.1:3001&port=5858"}
	end tell
end run
