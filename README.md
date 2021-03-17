# About app

In this we are going to make a places listing app which will exploit native device features like camera, maps and location. The launching screen will have list of all the places we add along with their picture, title and complete address of the place. These list of places will be tappable on clicking which we will be redirected to a page where we will have a 'view on map' button to show the location on google maps. On clicking on '+' button in appbar wewill be redirected to a page where we can add a place by filling the details and location of the place can be chosen by clicking on either of 2 buttons current location and select on map. In current location we will get the current location of ours and a snapshot of map will be there on this screen and on clicking select on mapa full screen google map will open on the screen and we can then place the marker on whichever location we want and click on tick button in appbar then our map snapshot will be shown on the screen. Finally on clicking add place our place will be added. 

In this app we are not going to use other servers to store our data instead we will be storing the data on device to make it user specific. The images of the places will be stored in phone's file system so that it can survive app reloads and the place data will be stored on the SQLite database on the device.

![output](https://user-images.githubusercontent.com/23056679/111539465-ebbe6d80-8793-11eb-9f4d-788ef3eb3db3.gif)


## How to use

### step 1:

Download or clone this repo by using the following link:

[<u>git@github.com:harleenkaurchadha/great_places_app.git</u>](https://git@github.com:harleenkaurchadha/great_places_app.git)

### step 2:

Go to the project root and execute the following command to get all dependencies packages:
```bash
flutter pub get
```

### step 3:

Get your google api key [https://developers.google.com/maps/](https://developers.google.com/maps/)
<br>Enter your google api key in the following places:</br>

### For Android 

1.In location_helper.dart file

2.In the application manifest android/app/src/main/AndroidManifest.xml:
```bash
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

```

### For IOS

In the application delegate ios/Runner/AppDelegate.m:
```bash
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
![output](https://user-images.githubusercontent.com/23056679/111539414-dea17e80-8793-11eb-9822-087524af8f11.gif)

```

