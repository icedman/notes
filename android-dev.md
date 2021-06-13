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

