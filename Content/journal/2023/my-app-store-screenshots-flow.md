---
title: My App Store Screenshots Flow
date: 2023-06-30 17:00
description: My App Store Screenshots Flow
tags: howto
---


For Quiet I need to make 975 screenshots for the App Store. It is way way too much to do that by hand. And waaaay to much work to put it in a nice frame with a label.

##### Quick math
- 2 iPad models _*_ 4 screenshots = 8
- 3 iPhone models _*_ 4 screenshots = 12
- 1 Mac model _*_ 5 screenshots = 5
- 25 screenshots per language _*_ 39 languages = **975**



### 1. Write UI Tests and make screenshots

Start with a function which makes the screenshots.

```Swift
func takeScreenshot(name: String) {
    let fullScreenshot = XCUIScreen.main.screenshot()
    let type = "public.png"
    let payload = fullScreenshot.pngRepresentation
    let name = "\(UIDevice.current.name)-\(name).png"
    let screenshot = XCTAttachment(
    	uniformTypeIdentifier: type, 
    	name: name, 
    	payload: payload, 
    	userInfo: nil
    )
    screenshot.lifetime = .keepAlways
    add(screenshot)
}

```

In this example I only switch tabs and only show the iPhone part. Part for iPad is similar.

```Swift
// Device is an iPhone
if UIDevice.current.userInterfaceIdiom == .phone {
	let app = XCUIApplication()
	app.launchArguments = ["enable-screenshot-data"]
	app.launch()

	let tabBar = app.tabBars.element(boundBy: 0)

	// First view
	takeScreenshot(name: "0")
	sleep(2)

	// Tap on tabbar to go to second view
	tabBar.buttons.element(boundBy: 1).tap()
	sleep(2)
	takeScreenshot(name: "1")
	sleep(2)

	// Tap on tabbar to go to third view
	tabBar.buttons.element(boundBy: 2).tap()
	sleep(2)
	takeScreenshot(name: "2")
	sleep(2)

	// Tap on tabbar to go to fourth view
	tabBar.buttons.element(boundBy: 3).tap()
	sleep(2)
	takeScreenshot(name: "3")
	sleep(2)
}

```

With Xcode's record test functionality it is easy to navigate through an app and learn
how to write UITests.


### 2. Run UITest automated

With a [bit of help from the internet](https://blog.winsmith.de/english/ios/2020/04/14/xcuitest-screenshots.html) I tweaked a shell script 
that runs the UITest created above on all devices and languages specified.


```Shell
#!/bin/bash

# The Xcode project to create screenshots for
projectName="/path/to/project/AppName/AppName.xcodeproj"

# The scheme to run tests for
schemeName="AppNameUITests"

# Temporary Data Folder
tempFolder="/tmp/AppNameData"

# Save final screenshots into this folder (it will be created)
targetFolder="/path/to/project/AppName/fastlane/screenshots/ios"

# All the simulators we want to screenshot
simulators=(
    "iPhone 11 Pro Max"
    "iPhone 14 Pro Max"
    "iPhone 8 Plus"
    "iPad Pro (12.9-inch) (6th generation)"
    "iPad Pro (12.9-inch) (2nd generation)"
)

# All the languages we want to screenshot (ISO 3166-1 codes)
languages=(
    "ar-SA"
    "de-DE"
    "en-GB"
    "es-ES"
    "es-MX"
    "fr-CA"
    "fr-FR"
    "he"
    "ja"
    "ko"
    "nl-NL"
    "pt-BR"
    "pt-PT"
    "zh-Hans"
    "zh-Hant"
)

for simulator in "${simulators[@]}"
do
    # Boot simulator
    echo "$simulator booting"
    xcrun simctl boot "$simulator"

    # Get UUID of simulator
    deviceUUID=$(xcrun simctl list devices | grep "(Booted)" | grep -E -o -i "([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})")
    echo "uuid: $deviceUUID"

    # Override statusbar
    echo "Override statusbar"
    xcrun simctl status_bar $deviceUUID override --time "2007-01-09T09:41:00+01:00" --dataNetwork wifi --wifiMode active --wifiBars 3 --cellularMode active --cellularBars 4 --batteryState charged --batteryLevel 100 &> /dev/null

    for language in "${languages[@]}"
    do
        rm -rf $tempFolder/Logs/Test
        echo "Building and Running for $simulator in $language"
        xcodebuild -testLanguage $language -scheme $schemeName -project $projectName -derivedDataPath $tempFolder -destination "platform=iOS Simulator,name=$simulator" build test
        echo "Collecting Results..."
        mkdir -p "$targetFolder/$language"
        find $tempFolder/Logs/Test -maxdepth 1 -type d -exec xcparse screenshots {} "$targetFolder/$language" \;
    done

    xcrun simctl shutdown $deviceUUID
    echo "$simulator shutdown"
done

```

Note: you need [xcparce](https://github.com/ChargePoint/xcparse) and Xcode command line tools installed for this script.


### 3. Remove UUID's from screenshot file names

I reused an AppleScript that I was using for another automated flows.

```AppleScript
on run {input, parameters}
	repeat with myFile in input
		tell application "System Events"
			set myName to the characters 1 thru ((offset of ".png" in (name of myFile as text)) - 1) of (name of myFile as text)
			tell application "Finder"
				set myExtention to name extension of (myFile as alias)
				set myNewName to characters 1 thru (((length of myName) - 37) as number) of (myName as text)
				set name of file (myFile as text) to (myNewName & "." & myExtention as text)
			end tell
		end tell
	end repeat
end run
```

Now we have a nice file name that we can use in the next step.


### 4. Framing

[ScreenshotFramer](https://github.com/Patrick-Kladek/ScreenshotFramer) an app made by the people of MindNode.

I has a nice UI for you (or designer) can make a nice framing of the screenshot. You can add text (localised), background colours, and other images.


![ScreenshotFramer UI](../../../assets/images/journal/my-app-store-screenshot-flow/screenshot-framer.png "ScreenshotFramer UI")


To create framed screenshot for all devices simply type this command in the Terminal.

```
Screenshot-Framer-CLI -project .
```


### 5. Sending it to App Store Connect

Currently I use [fastlane deliver](https://docs.fastlane.tools/actions/deliver/) to send the framed screenshots to App Store Connect.
Their website has the best documentation on how to set it up.
I am however writing a Xcode Project Plugin with the App Store Connect API to send screenshots and metadata to App Store Connect. 
With all the exciting Vision Pro stuff and experimenting that plugin is on hold for now, but will continue when the dust has settled down a bit.


### After thoughts

I did it a few times by hand, I took me a whole day and some RSI issues 😝

Now the wole process takes 30 minutes... (on a M1 Mac Mini)

- 20 minutes taking screenshots
- 6 minutes framing
- 4 minutes uploading

Run this flow every time I release a new version of Quiet, so it always has up to date screenshots.

Initial setup took me approximately half a day.
