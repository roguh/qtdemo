# Qt Demo
## Graphics
- StackView; navigating with pop() and push().
- Use of the `qtquickcontrols2.conf` file to enable Android's Material style.
- Animation on state changes.
- Scrolling a listview.
- Displaying a listmodel with listview's delegate.

- TODO hide back button when nothing to pop()
- TODO screen agnostic sizes
- TODO min and max sizes
- TODO test for accessibility 

## Logic
- Defining a custom Qt object in C++.
- Qt context, set properties from C++.

- Signals in DataObject. 
- Signals and slots in NotificationClient.
- Defining a listmodel.
- States.

- TODO communicating with an http server, with and without ssl
- TODO all sensors
- TODO location

## Android Specific
- QAndroidJniObject
- conditional compilation using `#if defined(Q_OS_ANDROID)` and .pro file
- Java source code in android-sources/src/org/.../*.java    
- Java is registered in android-sources/AndroidManifest.xml

## Installation
Developed using the open source version of the Qt Creator version 5.7.0.
Tested on an Android emulator and on an Ubuntu desktop.

Open the `.pro` file in a recent version of QtCreator to start developing.

## Utilities
takes tags, attributes, any data, children
generates
DTD, XML parser, XML generator, C++ QObject, Java object

with support for including other files/code segments (CPP-style) in the C++ and Java source code

goal: less than 100 lines, excluding C++ and Java templates

need dtd generation, xml generation, template generation, file insertion into templates
