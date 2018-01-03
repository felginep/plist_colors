# PlistColors

This script extract colors from plist and creates a png.

# How to install
```
gem install plist_colors
```

To build it from source:
```
cd plist_colors
gem build plist_colors.gemspec
gem install ./plist_colors-x.x.x.gem
```

## Usage

Go to your `.xcodeproj` folder `cd /paht/to/my/xcodeproj`.

Then run 
```
plist_colors
open color_mapping.png
```

## Example

For this plist:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>colors</key>
	<dict>
		<key>primaryColor</key>
		<string>DB0011</string>
		<key>primaryHighlightedColor</key>
		<string>83000A</string>
		<key>secondaryColor</key>
		<string>FFFFFF</string>
		<key>tertiaryColor</key>
		<string>4D6474</string>
		<key>tertiaryHighlightedColor</key>
		<string>253038</string>
		<key>contentBackgroundColor</key>
		<string>EDEDED</string>
		<key>darkContentBackgroundColor</key>
		<string>D6D6D6</string>
		<key>blackTextColor</key>
		<string>000000</string>
		<key>mediumTextColor</key>
		<string>333333</string>
		<key>defaultTextColor</key>
		<string>5C5C5C</string>
		<key>surveyAccessoryColor</key>
		<string>008580</string>
	</dict>
</dict>
</plist>
```

This generates the following result.

![example](https://github.com/felginep/plist_colors/blob/master/images/example.png?raw=true)
