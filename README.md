# android_task

# Android Task



## Windows Environment Setup
 * [Install NodeJs](https://nodejs.org/en/)
 * [Install Java8 JDK updated patch](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Install Ruby 2.3](https://nodejs.org/en/)
    * [Download and install Ruby 2.3 from rubyinstaller.org](https://rubyinstaller.org/downloads/)
    * [Download and install DevKit for respective Ruby version](https://rubyinstaller.org/downloads/)  
 * [Install Android Studio and add android tools to environment](https://developer.android.com/studio/?gclid=Cj0KCQiA4aXiBRCRARIsAMBZGz82iVg2ztLPDrehF3E0yAxl5OeSXo3hJ21oAxy2gsqGJBabxBGkOYMaApzoEALw_wcB)
 * [Install Appium package with below command from command prompt](http://appium.io/docs/en/about-appium/getting-started/)
    * *npm install –g Appium*   

## Set up Android Emulators
* You can use any android emulators like Android Studio, BlueStack, Genymotion
  * I prefer Genymotion for android as it is easy to set up and has more collection of device types and they provide free version for personal use.
  * Open cmd and execute “adb devices” to see attached android devices
  * I am using *“Nexus 6 with Android 8.0”* emulator device  for this challenge
 
## Setting up Ruby gems and Framework
* [Clone GitHub Repository](https://github.com/radhakrishnanakireddy/tech)
* Open cmd and execute below commands
   * *gem install nokogiri -v 1.9.1*
   * *gem install bundler -v 1.17.3* (This will install all required gems for framework)
* Start Android Device emulator
    *	In my case I am using “Genymotion”
* Open cmd and execute below command to install require gems
   * Goto Project root folder
   * Execute *"bundle install"* command
* Start Appium with below cmd
   * *cmd =>  appium*
* Goto tech folder – (note: user should trigger test execution from root folder)
* Open cmd and execute below command to trigger Test execution
    *  *rake test:android*
*	*Test Reports*
    * Goto to *"report_android"* folder
    * Open *"android_report.html"* in Chrome or Firefox browser to view it

## Check Points
#### You should check below points before Triggering Test Execution
* Check Android Emulator Device is Running 
* Check adb is recognizing android emulators with below command
    * adb devices
* Check Appium is running 
* To start Appium use below command
    * appium
* Check JAVA_HOME and Java/bin is added to System Environment variables
    * Need to Restart System if you add JAVA_HOME and its Java/bin to System Environment variables manually
      * Note : If you choose *automationName* as *UiAutomator2* and  you may get JAVA_HOME error if yo don not set *JAVA_HOME* in Envrioment

