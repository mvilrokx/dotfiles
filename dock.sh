#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/DBeaver.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Microsoft Outlook.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/zoom.us.app"

killall Dock
