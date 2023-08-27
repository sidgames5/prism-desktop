# prism-android

The official android app for Prism Chat.

# Workspace Setup

1. Install Haxe
2. Install HaxeFlixel
3. Install required haxelibs: `prism.hx`, `android6permissions`
4. Install VSCode
5. Install the Haxe Extension Pack and Lime extensions on VSCode
6. Install Java **JDK 11**
7. Install Android Studio
8. Download android **SDK 28** (lime will try to do this for you)
9. Download android **NDK 21** (any other version of the NDK **WILL NOT WORK!!!**)
10. Run `lime setup android` and enter all of the paths required
11. Connect an android phone running **android 9 or newer** to your system with a USB data cable
12. Enable developer mode on your phone by going to `Settings > About phone > Software information` and repeatedly tapping on the build number
13. Enable USB debugging in `Settings > Developer options`

You can now develop and test the app!

# Building and testing

To just build the application, run `lime build android`. The APK file will be in `bin/android/bin/app/build/outputs/apk/debug/`.

There are a few other commands you can run:

## Build the app and do nothing

Windows: `build.bat`

Linux & Mac: `./build.sh`

## Build and run the app on the android emulator

Windows: `emulator.bat`

Linux & Mac: `./emulator.sh`

## Build and install the app on the connected phone

Windows: `install.bat`

Linux & Mac: `./install.sh`

## Build and run the app on the connected phone

Windows: `test.bat`

Linux & Mac: `./test.sh`
