# install sdk
```sh
sdkmanager "platforms;android-28" "build-tools;28.0.3" "emulator" "system-images;android-28;google_apis;x86_64"
```

# create avd
```sh
avdmanager --verbose create avd --force --name "default" --package "system-images;android-25;google_apis;x86_64" --device "5.4in FWVGA"
```

# paths


# android
```sh
export ANDROID_HOME=/data/opt/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME
export NDK_ROOT=$ANDROID_HOME/android-ndk-r20
export JAVA_HOME=$ANDROID_HOME/jdk1.8.0_181
export JDK_HOME=$JAVA_HOME

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$JAVA_HOME/bin
```

```sh
npm install -g cordova
pacman -S gradle
```

```sh
git clone ...flutter
flutter doctor
```

* android-ndk-r20-linux-x86_64.zip
* jdk-8u181-linux-x64.tar.gz
* platform-tools_r29.0.4-linux.zip
* sdk-tools-linux-4333796.zip


```sh
sudo groupadd plugdev
sudo usermod -aG plugdev <user>
sudo vi /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="2e81", MODE="0666", GROUP="plugdev"
sudo udevadm control --reload-rules
```

# Google
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
# LG
SUBSYSTEM=="usb", ATTR{idVendor}=="1004", MODE="0666", GROUP="plugdev"
# OnePlus
SUBSYSTEM=="usb", ATTR{idVendor}=="2a70", MODE="0666", GROUP="plugdev"
# Samsung
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"
# Xiaomi
SUBSYSTEM=="usb", ATTR{idVendor}=="2717", MODE="0666", GROUP="plugdev"




export ANDROID_HOME=$USER_HOME/Developer/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME
export NDK_ROOT=$ANDROID_HOME/ndk/21.3.6528147
export PATH=$NDK_ROOT:$PATH
export PATH=$ANDROID_HOME:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools/:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
#export PATH=$ANDROID_HOME/build-tools/21.1.2:$PATH
export PATH=$ANDROID_HOME/build-tools/28.0.3:$PATH

# export JAVA_HOME=$ANDROID_HOME/jdk1.8.0_181
export JAVA_HOME=$ANDROID_HOME/jdk-19.0.1
# export JAVA_HOME=$ANDROID_HOME/jdk-17.0.10+7-jre
# export JAVA_HOME=$ANDROID_HOME/jdk-11.0.2
export JDK_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

