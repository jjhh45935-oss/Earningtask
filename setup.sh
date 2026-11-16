#!/bin/bash
set -e

mkdir -p app/src/main/res/drawable
mkdir -p app/src/main/res/values
mkdir -p app/src/main/res/layout
mkdir -p app/src/main/java/com/task/app

cat << 'EOF' > settings.gradle
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "EarningTask"
include ':app'
EOF

cat << 'EOF' > build.gradle
plugins {
    id 'com.android.application' version '8.9.1' apply false
    id 'com.google.gms.google-services' version '4.4.2' apply false
}
EOF

cat << 'EOF' > gradle.properties
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=false
EOF

cat << 'EOF' > app/build.gradle
plugins {
    id 'com.android.application'
    id 'com.google.gms.google-services'
}

android {
    namespace 'com.task.app'
    compileSdk 35

    defaultConfig {
        applicationId "Com.task.app"
        minSdk 24
        targetSdk 35
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.7.0'
    implementation 'com.google.android.material:material:1.12.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.2.0'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'

    implementation platform('com.google.firebase:firebase-bom:35.2.0')
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'
}
EOF

cat << 'EOF' > app/google-services.json
{
  "project_info": {
    "project_number": "871877040637",
    "project_id": "earning-task-9d1d2",
    "storage_bucket": "earning-task-9d1d2.firebasestorage.app"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:871877040637:android:45cf82db431cc101236194",
        "android_client_info": {
          "package_name": "Com.task.app"
        }
      },
      "oauth_client": [],
      "api_key": [
        {
          "current_key": "AIzaSyC6eGJcpDchQH73oS_wZsDg6-oya0WVevQ"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": []
        }
      }
    }
  ],
  "configuration_version": "1"
}
EOF

cat << 'EOF' > app/src/main/AndroidManifest.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_app_logo"
        android:label="@string/app_name"
        android:roundIcon="@drawable/ic_app_logo"
        android:supportsRtl="true"
        android:theme="@style/Theme.EarningTask">

        <activity
            android:name=".LoginActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

        <activity android:name=".RegisterActivity" android:exported="false" />
        <activity android:name=".MainActivity" android:exported="false" />
        <activity android:name=".SpinActivity" android:exported="false" />
        <activity android:name=".WalletActivity" android:exported="false" />

    </application>
</manifest>
EOF

cat << 'EOF' > app/src/main/res/drawable/ic_app_logo.xml
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="#4F46E5"
        android:pathData="M12,2A10,10 0 1,0 22,12A10,10 0 0,0 12,2Z" />
    <path
        android:fillColor="#F59E0B"
        android:pathData="M12,6.5L13.76,10.07L17.7,10.64L14.85,13.42L15.52,17.35L12,15.49L8.48,17.35L9.15,13.42L6.3,10.64L10.24,10.07Z" />
</vector>
EOF

cat << 'EOF' > app/src/main/res/values/colors.xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="primary">#4F46E5</color>
    <color name="primary_dark">#3730A3</color>
    <color name="accent">#F59E0B</color>
    <color name="bg_light">#F3F4F6</color>
    <color name="white">#FFFFFF</color>
    <color name="text_dark">#111827</color>
    <color name="text_gray">#6B7280</color>
    <color name="green">#10B981</color>
    <color name="red">#EF4444</color>
</resources>
EOF

cat << 'EOF' > app/src/main/res/values/strings.xml
<resources>
    <string name="app_name">Earning Task</string>
</resources>
EOF

cat << 'EOF' > app/src/main/res/values/themes.xml
<resources>
    <style name="Theme.EarningTask" parent="Theme.MaterialComponents.DayNight.NoActionBar">
        <item name="colorPrimary">@color/primary</item>
        <item name="colorPrimaryVariant">@color/primary_dark</item>
        <item name="colorOnPrimary">@color/white</item>
        <item name="colorSecondary">@color/accent</item>
        <item name="android:statusBarColor">@color/primary_dark</item>
    </style>
</resources>
EOF

cat << 'EOF' > app/src/main/res/layout/activity_login.xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/bg_light"
    android:fillViewport="true">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center"
        android:orientation="vertical"
        android:padding="24dp">

        <ImageView
            android:layout_width="80dp"
            android:layout_height="80dp"
            android:src="@drawable/ic_app_logo" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="12dp"
            android:text="Earning Task"
            android:textColor="@color/text_dark"
            android:textSize="26sp"
            android:textStyle="bold" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginBottom="24dp"
            android:text="Login karke tasks aur spin se kamayein"
            android:textColor="@color/text_gray"
            android:textSize="14sp" />

        <com.google.android.material.card.MaterialCardView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            app:cardCornerRadius="16dp"
            app:cardElevation="4dp">

            <LinearLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:orientation="vertical"
                android:padding="20dp">

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:hint="Email ID">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etEmail"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textEmailAddress" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:layout_marginTop="12dp"
                    android:hint="Password"
                    app:passwordToggleEnabled="true">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etPassword"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textPassword" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.button.MaterialButton
                    android:id="@+id/btnLogin"
                    android:layout_width="match_parent"
                    android:layout_height="52dp"
                    android:layout_marginTop="20dp"
                    android:text="Login Karein"
                    android:textAllCaps="false"
                    android:textSize="16sp"
                    app:cornerRadius="12dp" />

                <ProgressBar
                    android:id="@+id/progressBar"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center"
                    android:layout_marginTop="12dp"
                    android:visibility="gone" />

                <TextView
                    android:id="@+id/tvGoRegister"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center"
                    android:layout_marginTop="16dp"
                    android:padding="6dp"
                    android:text="Naya account banana hai? Register Karein"
                    android:textColor="@color/primary"
                    android:textStyle="bold" />

            </LinearLayout>
        </com.google.android.material.card.MaterialCardView>
    </LinearLayout>
</ScrollView>
EOF

cat << 'EOF' > app/src/main/res/layout/activity_register.xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/bg_light"
    android:fillViewport="true">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center"
        android:orientation="vertical"
        android:padding="24dp">

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Naya Account Banayein"
            android:textColor="@color/text_dark"
            android:textSize="24sp"
            android:textStyle="bold" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="4dp"
            android:layout_marginBottom="20dp"
            android:text="Registration par 1 Free Spin milega!"
            android:textColor="@color/green"
            android:textStyle="bold" />

        <com.google.android.material.card.MaterialCardView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            app:cardCornerRadius="16dp"
            app:cardElevation="4dp">

            <LinearLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:orientation="vertical"
                android:padding="20dp">

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:hint="Poora Naam">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etName"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textPersonName" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:layout_marginTop="12dp"
                    android:hint="Email ID">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etEmail"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textEmailAddress" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:layout_marginTop="12dp"
                    android:hint="Password (min 6 characters)"
                    app:passwordToggleEnabled="true">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etPassword"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textPassword" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.textfield.TextInputLayout
                    style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:layout_marginTop="12dp"
                    android:hint="Confirm Password"
                    app:passwordToggleEnabled="true">

                    <com.google.android.material.textfield.TextInputEditText
                        android:id="@+id/etConfirmPassword"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:inputType="textPassword" />
                </com.google.android.material.textfield.TextInputLayout>

                <com.google.android.material.button.MaterialButton
                    android:id="@+id/btnRegister"
                    android:layout_width="match_parent"
                    android:layout_height="52dp"
                    android:layout_marginTop="20dp"
                    android:text="Register Karein"
                    android:textAllCaps="false"
                    android:textSize="16sp"
                    app:cornerRadius="12dp" />

                <ProgressBar
                    android:id="@+id/progressBar"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center"
                    android:layout_marginTop="12dp"
                    android:visibility="gone" />

                <TextView
                    android:id="@+id/tvGoLogin"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center"
                    android:layout_marginTop="16dp"
                    android:padding="6dp"
                    android:text="Pehle se account hai? Login Karein"
                    android:textColor="@color/primary"
                    android:textStyle="bold" />

            </LinearLayout>
        </com.google.android.material.card.MaterialCardView>
    </LinearLayout>
</ScrollView>
EOF

cat << 'EOF' > app/src/main/res/layout/activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/bg_light"
    android:orientation="vertical">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:background="@color/primary"
        android:orientation="vertical"
        android:padding="16dp">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:gravity="center_vertical"
            android:orientation="horizontal">

            <TextView
                android:id="@+id/tvUserName"
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_weight="1"
                android:text="Namaste, User"
                android:textColor="@color/white"
                android:textSize="18sp"
                android:textStyle="bold" />

            <com.google.android.material.button.MaterialButton
                android:id="@+id/btnLogout"
                style="@style/Widget.MaterialComponents.Button.OutlinedButton"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Logout"
                android:textAllCaps="false"
                android:textColor="@color/white"
                app:strokeColor="@color/white" />
        </LinearLayout>

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginTop="12dp"
            android:orientation="horizontal">

            <com.google.android.material.card.MaterialCardView
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_marginEnd="6dp"
                android:layout_weight="1"
                app:cardBackgroundColor="@color/primary_dark"
                app:cardCornerRadius="12dp">

                <LinearLayout
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:orientation="vertical"
                    android:padding="12dp">

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="Total Coins"
                        android:textColor="#D1D5DB"
                        android:textSize="12sp" />

                    <TextView
                        android:id="@+id/tvCoins"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="0"
                        android:textColor="@color/accent"
                        android:textSize="22sp"
                        android:textStyle="bold" />
                </LinearLayout>
            </com.google.android.material.card.MaterialCardView>

            <com.google.android.material.card.MaterialCardView
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_marginStart="6dp"
                android:layout_weight="1"
                app:cardBackgroundColor="@color/primary_dark"
                app:cardCornerRadius="12dp">

                <LinearLayout
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:orientation="vertical"
                    android:padding="12dp">

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="Spins Left"
                        android:textColor="#D1D5DB"
                        android:textSize="12sp" />

                    <TextView
                        android:id="@+id/tvSpins"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="0"
                        android:textColor="@color/green"
                        android:textSize="22sp"
                        android:textStyle="bold" />
                </LinearLayout>
            </com.google.android.material.card.MaterialCardView>
        </LinearLayout>

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginTop="12dp"
            android:orientation="horizontal">

            <com.google.android.material.button.MaterialButton
                android:id="@+id/btnOpenSpin"
                android:layout_width="0dp"
                android:layout_height="48dp"
                android:layout_marginEnd="6dp"
                android:layout_weight="1"
                android:backgroundTint="@color/accent"
                android:text="Spin &amp; Win"
                android:textAllCaps="false"
                android:textColor="@color/text_dark"
                android:textStyle="bold"
                app:cornerRadius="10dp" />

            <com.google.android.material.button.MaterialButton
                android:id="@+id/btnOpenWallet"
                android:layout_width="0dp"
                android:layout_height="48dp"
                android:layout_marginStart="6dp"
                android:layout_weight="1"
                android:backgroundTint="@color/green"
                android:text="Wallet / Withdraw"
                android:textAllCaps="false"
                android:textColor="@color/white"
                android:textStyle="bold"
                app:cornerRadius="10dp" />
        </LinearLayout>
    </LinearLayout>

    <com.google.android.material.card.MaterialCardView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_margin="12dp"
        app:cardCornerRadius="12dp"
        app:cardElevation="3dp">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:gravity="center_vertical"
            android:orientation="horizontal"
            android:padding="14dp">

            <LinearLayout
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_weight="1"
                android:orientation="vertical">

                <TextView
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="Daily Check-in Bonus"
                    android:textColor="@color/text_dark"
                    android:textSize="16sp"
                    android:textStyle="bold" />

                <TextView
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="Rozana +25 Coins aur +1 Spin paayein"
                    android:textColor="@color/text_gray"
                    android:textSize="13sp" />
            </LinearLayout>

            <com.google.android.material.button.MaterialButton
                android:id="@+id/btnDailyCheckIn"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Claim"
                android:textAllCaps="false"
                app:cornerRadius="8dp" />
        </LinearLayout>
    </com.google.android.material.card.MaterialCardView>

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="14dp"
        android:layout_marginBottom="6dp"
        android:text="Available Tasks (Task pure karein aur Spin paayein)"
        android:textColor="@color/text_dark"
        android:textSize="15sp"
        android:textStyle="bold" />

    <ProgressBar
        android:id="@+id/progressTasks"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:visibility="gone" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/rvTasks"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:paddingHorizontal="12dp"
        android:paddingBottom="12dp" />

</LinearLayout>
EOF

cat << 'EOF' > app/src/main/res/layout/item_task.xml
<?xml version="1.0" encoding="utf-8"?>
<com.google.android.material.card.MaterialCardView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginBottom="10dp"
    app:cardCornerRadius="12dp"
    app:cardElevation="2dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center_vertical"
        android:orientation="horizontal"
        android:padding="14dp">

        <LinearLayout
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:orientation="vertical"
            android:paddingEnd="8dp">

            <TextView
                android:id="@+id/tvTaskTitle"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Task Title"
                android:textColor="@color/text_dark"
                android:textSize="16sp"
                android:textStyle="bold" />

            <TextView
                android:id="@+id/tvTaskDesc"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="2dp"
                android:text="Task description"
                android:textColor="@color/text_gray"
                android:textSize="13sp" />

            <TextView
                android:id="@+id/tvTaskReward"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="6dp"
                android:text="+30 Coins | +1 Spin"
                android:textColor="@color/green"
                android:textSize="13sp"
                android:textStyle="bold" />
        </LinearLayout>

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnCompleteTask"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Start"
            android:textAllCaps="false"
            app:cornerRadius="8dp" />
    </LinearLayout>
</com.google.android.material.card.MaterialCardView>
EOF

cat << 'EOF' > app/src/main/res/layout/activity_spin.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/bg_light"
    android:gravity="center_horizontal"
    android:orientation="vertical"
    android:padding="16dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center_vertical"
        android:orientation="horizontal">

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnBack"
            style="@style/Widget.MaterialComponents.Button.TextButton"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="← Back"
            android:textAllCaps="false" />

        <TextView
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:gravity="center"
            android:text="Spin &amp; Win"
            android:textColor="@color/text_dark"
            android:textSize="20sp"
            android:textStyle="bold" />

        <TextView
            android:id="@+id/tvCurrentCoins"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="0 Coins"
            android:textColor="@color/primary"
            android:textStyle="bold" />
    </LinearLayout>

    <TextView
        android:id="@+id/tvSpinsLeft"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="12dp"
        android:text="Available Spins: 0"
        android:textColor="@color/green"
        android:textSize="18sp"
        android:textStyle="bold" />

    <com.task.app.SpinWheelView
        android:id="@+id/spinWheelView"
        android:layout_width="320dp"
        android:layout_height="320dp"
        android:layout_marginTop="24dp" />

    <com.google.android.material.button.MaterialButton
        android:id="@+id/btnSpin"
        android:layout_width="220dp"
        android:layout_height="56dp"
        android:layout_marginTop="28dp"
        android:backgroundTint="@color/accent"
        android:text="SPIN NOW"
        android:textColor="@color/text_dark"
        android:textSize="18sp"
        android:textStyle="bold"
        app:cornerRadius="28dp" />

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="12dp"
        android:text="Zyada Spins ke liye Home par Tasks pure karein!"
        android:textColor="@color/text_gray"
        android:textSize="13sp" />

</LinearLayout>
EOF

cat << 'EOF' > app/src/main/res/layout/activity_wallet.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/bg_light"
    android:orientation="vertical"
    android:padding="16dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center_vertical"
        android:orientation="horizontal">

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnBack"
            style="@style/Widget.MaterialComponents.Button.TextButton"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="← Back"
            android:textAllCaps="false" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="My Wallet &amp; Withdraw"
            android:textColor="@color/text_dark"
            android:textSize="19sp"
            android:textStyle="bold" />
    </LinearLayout>

    <com.google.android.material.card.MaterialCardView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp"
        app:cardBackgroundColor="@color/primary"
        app:cardCornerRadius="14dp">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical"
            android:padding="16dp">

            <TextView
                android:id="@+id/tvWalletCoins"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="0 Coins"
                android:textColor="@color/accent"
                android:textSize="26sp"
                android:textStyle="bold" />

            <TextView
                android:id="@+id/tvWalletRupees"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Value: ₹0.00 (10 Coins = ₹1)"
                android:textColor="@color/white"
                android:textSize="14sp" />
        </LinearLayout>
    </com.google.android.material.card.MaterialCardView>

    <com.google.android.material.card.MaterialCardView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginTop="12dp"
        app:cardCornerRadius="12dp">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical"
            android:padding="14dp">

            <com.google.android.material.textfield.TextInputLayout
                style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="UPI ID (e.g. name@upi)">

                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/etUpiId"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:inputType="textEmailAddress" />
            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="10dp"
                android:hint="Coins (Minimum 500 Coins = ₹50)">

                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/etCoins"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:inputType="number" />
            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.button.MaterialButton
                android:id="@+id/btnWithdraw"
                android:layout_width="match_parent"
                android:layout_height="48dp"
                android:layout_marginTop="12dp"
                android:text="Withdraw Request Bhejein"
                android:textAllCaps="false"
                app:cornerRadius="10dp" />
        </LinearLayout>
    </com.google.android.material.card.MaterialCardView>

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="14dp"
        android:layout_marginBottom="6dp"
        android:text="Withdrawal History"
        android:textColor="@color/text_dark"
        android:textSize="15sp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/tvNoHistory"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Abhi koi withdrawal request nahi hai."
        android:textColor="@color/text_gray"
        android:visibility="gone" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/rvHistory"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

</LinearLayout>
EOF

cat << 'EOF' > app/src/main/res/layout/item_withdraw.xml
<?xml version="1.0" encoding="utf-8"?>
<com.google.android.material.card.MaterialCardView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginBottom="8dp"
    app:cardCornerRadius="10dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center_vertical"
        android:orientation="horizontal"
        android:padding="12dp">

        <LinearLayout
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:orientation="vertical">

            <TextView
                android:id="@+id/tvWAmount"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="₹50 (500 Coins)"
                android:textColor="@color/text_dark"
                android:textStyle="bold" />

            <TextView
                android:id="@+id/tvWUpi"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="UPI: user@upi"
                android:textColor="@color/text_gray"
                android:textSize="12sp" />
        </LinearLayout>

        <TextView
            android:id="@+id/tvWStatus"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Pending"
            android:textColor="@color/accent"
            android:textStyle="bold" />
    </LinearLayout>
</com.google.android.material.card.MaterialCardView>
EOF

cat << 'EOF' > app/src/main/java/com/task/app/TaskModel.java
package com.task.app;

public class TaskModel {
    public String id;
    public String title;
    public String description;
    public String actionUrl;
    public long rewardCoins;
    public long rewardSpins;
    public int waitSeconds;
    public boolean completed;

    public TaskModel() {}

    public TaskModel(String id, String title, String description, String actionUrl, long rewardCoins, long rewardSpins, int waitSeconds) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.actionUrl = actionUrl;
        this.rewardCoins = rewardCoins;
        this.rewardSpins = rewardSpins;
        this.waitSeconds = waitSeconds;
        this.completed = false;
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/WithdrawModel.java
package com.task.app;

import com.google.firebase.Timestamp;

public class WithdrawModel {
    public String upiId;
    public long coinsUsed;
    public double rupeesAmount;
    public String status;
    public Timestamp createdAt;

    public WithdrawModel() {}
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/LoginActivity.java
package com.task.app;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;
import com.google.firebase.auth.FirebaseAuth;

public class LoginActivity extends AppCompatActivity {

    private TextInputEditText etEmail, etPassword;
    private MaterialButton btnLogin;
    private ProgressBar progressBar;
    private FirebaseAuth mAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        mAuth = FirebaseAuth.getInstance();
        etEmail = findViewById(R.id.etEmail);
        etPassword = findViewById(R.id.etPassword);
        btnLogin = findViewById(R.id.btnLogin);
        progressBar = findViewById(R.id.progressBar);
        TextView tvGoRegister = findViewById(R.id.tvGoRegister);

        btnLogin.setOnClickListener(v -> loginUser());
        tvGoRegister.setOnClickListener(v -> startActivity(new Intent(this, RegisterActivity.class)));
    }

    @Override
    protected void onStart() {
        super.onStart();
        if (mAuth.getCurrentUser() != null) {
            startActivity(new Intent(this, MainActivity.class));
            finish();
        }
    }

    private void loginUser() {
        String email = etEmail.getText() != null ? etEmail.getText().toString().trim() : "";
        String password = etPassword.getText() != null ? etPassword.getText().toString().trim() : "";

        if (TextUtils.isEmpty(email) || TextUtils.isEmpty(password)) {
            Toast.makeText(this, "Email aur Password dono bharein", Toast.LENGTH_SHORT).show();
            return;
        }

        progressBar.setVisibility(View.VISIBLE);
        btnLogin.setEnabled(false);

        mAuth.signInWithEmailAndPassword(email, password)
                .addOnSuccessListener(authResult -> {
                    progressBar.setVisibility(View.GONE);
                    startActivity(new Intent(this, MainActivity.class));
                    finish();
                })
                .addOnFailureListener(e -> {
                    progressBar.setVisibility(View.GONE);
                    btnLogin.setEnabled(true);
                    Toast.makeText(this, "Login failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                });
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/RegisterActivity.java
package com.task.app;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.UserProfileChangeRequest;
import com.google.firebase.firestore.FieldValue;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.HashMap;
import java.util.Map;

public class RegisterActivity extends AppCompatActivity {

    private TextInputEditText etName, etEmail, etPassword, etConfirmPassword;
    private MaterialButton btnRegister;
    private ProgressBar progressBar;
    private FirebaseAuth mAuth;
    private FirebaseFirestore db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        mAuth = FirebaseAuth.getInstance();
        db = FirebaseFirestore.getInstance();

        etName = findViewById(R.id.etName);
        etEmail = findViewById(R.id.etEmail);
        etPassword = findViewById(R.id.etPassword);
        etConfirmPassword = findViewById(R.id.etConfirmPassword);
        btnRegister = findViewById(R.id.btnRegister);
        progressBar = findViewById(R.id.progressBar);
        TextView tvGoLogin = findViewById(R.id.tvGoLogin);

        btnRegister.setOnClickListener(v -> registerUser());
        tvGoLogin.setOnClickListener(v -> finish());
    }

    private void registerUser() {
        String name = etName.getText() != null ? etName.getText().toString().trim() : "";
        String email = etEmail.getText() != null ? etEmail.getText().toString().trim() : "";
        String pass = etPassword.getText() != null ? etPassword.getText().toString().trim() : "";
        String confirm = etConfirmPassword.getText() != null ? etConfirmPassword.getText().toString().trim() : "";

        if (TextUtils.isEmpty(name) || TextUtils.isEmpty(email) || TextUtils.isEmpty(pass)) {
            Toast.makeText(this, "Sabhi fields bharna zaroori hai", Toast.LENGTH_SHORT).show();
            return;
        }
        if (pass.length() < 6) {
            Toast.makeText(this, "Password kam se kam 6 characters ka rakhein", Toast.LENGTH_SHORT).show();
            return;
        }
        if (!pass.equals(confirm)) {
            Toast.makeText(this, "Password match nahi kar raha", Toast.LENGTH_SHORT).show();
            return;
        }

        progressBar.setVisibility(View.VISIBLE);
        btnRegister.setEnabled(false);

        mAuth.createUserWithEmailAndPassword(email, pass)
                .addOnSuccessListener(authResult -> {
                    FirebaseUser user = authResult.getUser();
                    if (user == null) return;

                    user.updateProfile(new UserProfileChangeRequest.Builder().setDisplayName(name).build());

                    Map<String, Object> userMap = new HashMap<>();
                    userMap.put("uid", user.getUid());
                    userMap.put("name", name);
                    userMap.put("email", email);
                    userMap.put("coins", 0L);
                    userMap.put("spinsLeft", 1L);
                    userMap.put("totalEarned", 0L);
                    userMap.put("lastCheckInDate", "");
                    userMap.put("createdAt", FieldValue.serverTimestamp());

                    db.collection("users").document(user.getUid()).set(userMap)
                            .addOnSuccessListener(unused -> {
                                progressBar.setVisibility(View.GONE);
                                Toast.makeText(this, "Account ban gaya! Welcome +1 Spin mila", Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(this, MainActivity.class);
                                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                                startActivity(intent);
                            })
                            .addOnFailureListener(e -> {
                                progressBar.setVisibility(View.GONE);
                                btnRegister.setEnabled(true);
                                Toast.makeText(this, "Database error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                            });
                })
                .addOnFailureListener(e -> {
                    progressBar.setVisibility(View.GONE);
                    btnRegister.setEnabled(true);
                    Toast.makeText(this, "Registration failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                });
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/TaskAdapter.java
package com.task.app;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.button.MaterialButton;

import java.util.List;

public class TaskAdapter extends RecyclerView.Adapter<TaskAdapter.TaskVH> {

    public interface OnTaskClickListener {
        void onTaskStart(TaskModel task);
    }

    private final List<TaskModel> list;
    private final OnTaskClickListener listener;

    public TaskAdapter(List<TaskModel> list, OnTaskClickListener listener) {
        this.list = list;
        this.listener = listener;
    }

    @NonNull
    @Override
    public TaskVH onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_task, parent, false);
        return new TaskVH(v);
    }

    @Override
    public void onBindViewHolder(@NonNull TaskVH holder, int position) {
        TaskModel task = list.get(position);
        holder.tvTitle.setText(task.title);
        holder.tvDesc.setText(task.description);
        holder.tvReward.setText("+" + task.rewardCoins + " Coins  |  +" + task.rewardSpins + " Spin");

        if (task.completed) {
            holder.btnComplete.setText("Done ✓");
            holder.btnComplete.setEnabled(false);
        } else {
            holder.btnComplete.setText("Start");
            holder.btnComplete.setEnabled(true);
            holder.btnComplete.setOnClickListener(v -> listener.onTaskStart(task));
        }
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class TaskVH extends RecyclerView.ViewHolder {
        TextView tvTitle, tvDesc, tvReward;
        MaterialButton btnComplete;

        TaskVH(@NonNull View itemView) {
            super(itemView);
            tvTitle = itemView.findViewById(R.id.tvTaskTitle);
            tvDesc = itemView.findViewById(R.id.tvTaskDesc);
            tvReward = itemView.findViewById(R.id.tvTaskReward);
            btnComplete = itemView.findViewById(R.id.btnCompleteTask);
        }
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/MainActivity.java
package com.task.app;

import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.button.MaterialButton;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FieldValue;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.ListenerRegistration;
import com.google.firebase.firestore.WriteBatch;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class MainActivity extends AppCompatActivity {

    private TextView tvUserName, tvCoins, tvSpins;
    private MaterialButton btnDailyCheckIn;
    private ProgressBar progressTasks;
    private RecyclerView rvTasks;

    private FirebaseAuth mAuth;
    private FirebaseFirestore db;
    private ListenerRegistration userListener;

    private final List<TaskModel> taskList = new ArrayList<>();
    private final Set<String> completedTaskIds = new HashSet<>();
    private TaskAdapter adapter;
    private String lastCheckInDate = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mAuth = FirebaseAuth.getInstance();
        db = FirebaseFirestore.getInstance();

        FirebaseUser user = mAuth.getCurrentUser();
        if (user == null) {
            startActivity(new Intent(this, LoginActivity.class));
            finish();
            return;
        }

        tvUserName = findViewById(R.id.tvUserName);
        tvCoins = findViewById(R.id.tvCoins);
        tvSpins = findViewById(R.id.tvSpins);
        btnDailyCheckIn = findViewById(R.id.btnDailyCheckIn);
        progressTasks = findViewById(R.id.progressTasks);
        rvTasks = findViewById(R.id.rvTasks);

        rvTasks.setLayoutManager(new LinearLayoutManager(this));
        adapter = new TaskAdapter(taskList, this::handleTaskStart);
        rvTasks.setAdapter(adapter);

        findViewById(R.id.btnOpenSpin).setOnClickListener(v -> startActivity(new Intent(this, SpinActivity.class)));
        findViewById(R.id.btnOpenWallet).setOnClickListener(v -> startActivity(new Intent(this, WalletActivity.class)));
        findViewById(R.id.btnLogout).setOnClickListener(v -> {
            mAuth.signOut();
            startActivity(new Intent(this, LoginActivity.class));
            finish();
        });

        btnDailyCheckIn.setOnClickListener(v -> claimDailyCheckIn());

        listenUserData(user.getUid());
        loadTasks(user.getUid());
    }

    private void listenUserData(String uid) {
        userListener = db.collection("users").document(uid)
                .addSnapshotListener((snapshot, error) -> {
                    if (snapshot != null && snapshot.exists()) {
                        String name = snapshot.getString("name");
                        Long coins = snapshot.getLong("coins");
                        Long spins = snapshot.getLong("spinsLeft");
                        lastCheckInDate = snapshot.getString("lastCheckInDate");

                        tvUserName.setText("Namaste, " + (name != null ? name : "User"));
                        tvCoins.setText(String.valueOf(coins != null ? coins : 0));
                        tvSpins.setText(String.valueOf(spins != null ? spins : 0));

                        String today = getTodayDate();
                        if (today.equals(lastCheckInDate)) {
                            btnDailyCheckIn.setText("Claimed ✓");
                            btnDailyCheckIn.setEnabled(false);
                        } else {
                            btnDailyCheckIn.setText("Claim");
                            btnDailyCheckIn.setEnabled(true);
                        }
                    }
                });
    }

    private void claimDailyCheckIn() {
        FirebaseUser user = mAuth.getCurrentUser();
        if (user == null) return;
        String today = getTodayDate();
        btnDailyCheckIn.setEnabled(false);

        DocumentReference userRef = db.collection("users").document(user.getUid());
        db.runTransaction(transaction -> {
            DocumentSnapshot snap = transaction.get(userRef);
            String dbDate = snap.getString("lastCheckInDate");
            if (today.equals(dbDate)) {
                return false;
            }
            transaction.update(userRef,
                    "lastCheckInDate", today,
                    "coins", FieldValue.increment(25),
                    "totalEarned", FieldValue.increment(25),
                    "spinsLeft", FieldValue.increment(1));
            return true;
        }).addOnSuccessListener(claimed -> {
            if (Boolean.TRUE.equals(claimed)) {
                Toast.makeText(this, "Daily Bonus: +25 Coins & +1 Spin mila!", Toast.LENGTH_SHORT).show();
            }
        }).addOnFailureListener(e -> {
            btnDailyCheckIn.setEnabled(true);
            Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        });
    }

    private void loadTasks(String uid) {
        progressTasks.setVisibility(View.VISIBLE);
        db.collection("users").document(uid).collection("completedTasks").get()
                .addOnSuccessListener(completedSnap -> {
                    completedTaskIds.clear();
                    for (DocumentSnapshot d : completedSnap.getDocuments()) {
                        completedTaskIds.add(d.getId());
                    }
                    fetchFirestoreTasks();
                })
                .addOnFailureListener(e -> fetchFirestoreTasks());
    }

    private void fetchFirestoreTasks() {
        db.collection("tasks").get()
                .addOnSuccessListener(querySnapshot -> {
                    progressTasks.setVisibility(View.GONE);
                    taskList.clear();

                    if (querySnapshot.isEmpty()) {
                        addDefaultTasks();
                    } else {
                        for (DocumentSnapshot doc : querySnapshot.getDocuments()) {
                            String id = doc.getId();
                            String title = doc.getString("title");
                            String desc = doc.getString("description");
                            String url = doc.getString("actionUrl");
                            Long coins = doc.getLong("rewardCoins");
                            Long spins = doc.getLong("rewardSpins");
                            Long wait = doc.getLong("waitSeconds");

                            TaskModel model = new TaskModel(
                                    id,
                                    title != null ? title : "Special Task",
                                    desc != null ? desc : "Task complete karein aur reward paayein",
                                    url != null ? url : "",
                                    coins != null ? coins : 20,
                                    spins != null ? spins : 1,
                                    wait != null ? wait.intValue() : 5
                            );
                            model.completed = completedTaskIds.contains(id);
                            taskList.add(model);
                        }
                    }
                    adapter.notifyDataSetChanged();
                })
                .addOnFailureListener(e -> {
                    progressTasks.setVisibility(View.GONE);
                    taskList.clear();
                    addDefaultTasks();
                    adapter.notifyDataSetChanged();
                });
    }

    private void addDefaultTasks() {
        TaskModel[] defaults = new TaskModel[]{
                new TaskModel("default_1", "Welcome Verification Task", "5 second wait karke apna pehla reward claim karein", "TIMER", 30, 1, 5),
                new TaskModel("default_2", "Share Earning Task App", "App ko doston ke saath WhatsApp par share karein", "SHARE_APP", 50, 2, 3),
                new TaskModel("default_3", "Explore Rules & Tips", "10 second task guide check karein aur bonus paayein", "TIMER", 40, 1, 10),
                new TaskModel("default_4", "Daily Offer Check", "Partner offer page visit karein (10 sec)", "https://www.google.com", 60, 2, 10),
                new TaskModel("default_5", "Bonus Spin Booster", "Task verify karein aur extra spins jeetein", "TIMER", 25, 2, 5)
        };
        for (TaskModel t : defaults) {
            t.completed = completedTaskIds.contains(t.id);
            taskList.add(t);
        }
    }

    private void handleTaskStart(TaskModel task) {
        if ("SHARE_APP".equalsIgnoreCase(task.actionUrl)) {
            Intent shareIntent = new Intent(Intent.ACTION_SEND);
            shareIntent.setType("text/plain");
            shareIntent.putExtra(Intent.EXTRA_TEXT, "Earning Task app download karein aur daily tasks + spin se paise kamayein!");
            startActivity(Intent.createChooser(shareIntent, "Share via"));
            showVerificationDialog(task);
            return;
        }

        if (task.actionUrl != null && task.actionUrl.startsWith("http")) {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(task.actionUrl)));
            } catch (Exception ignored) {}
        }

        showVerificationDialog(task);
    }

    private void showVerificationDialog(TaskModel task) {
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle("Task Verify Ho Raha Hai...")
                .setMessage("Kripya wait karein: " + task.waitSeconds + " seconds")
                .setCancelable(false)
                .create();
        dialog.show();

        new CountDownTimer(task.waitSeconds * 1000L, 1000L) {
            @Override
            public void onTick(long millisUntilFinished) {
                if (dialog.isShowing()) {
                    dialog.setMessage("Task verify ho raha hai... " + ((millisUntilFinished / 1000) + 1) + " sec bache hain");
                }
            }

            @Override
            public void onFinish() {
                if (dialog.isShowing()) dialog.dismiss();
                completeTaskInFirestore(task);
            }
        }.start();
    }

    private void completeTaskInFirestore(TaskModel task) {
        FirebaseUser user = mAuth.getCurrentUser();
        if (user == null || completedTaskIds.contains(task.id)) return;

        DocumentReference userRef = db.collection("users").document(user.getUid());
        DocumentReference doneRef = userRef.collection("completedTasks").document(task.id);

        Map<String, Object> doneData = new HashMap<>();
        doneData.put("title", task.title);
        doneData.put("rewardCoins", task.rewardCoins);
        doneData.put("rewardSpins", task.rewardSpins);
        doneData.put("completedAt", FieldValue.serverTimestamp());

        WriteBatch batch = db.batch();
        batch.set(doneRef, doneData);
        batch.update(userRef,
                "coins", FieldValue.increment(task.rewardCoins),
                "totalEarned", FieldValue.increment(task.rewardCoins),
                "spinsLeft", FieldValue.increment(task.rewardSpins));

        batch.commit().addOnSuccessListener(unused -> {
            completedTaskIds.add(task.id);
            task.completed = true;
            adapter.notifyDataSetChanged();
            Toast.makeText(this, "Task Complete! +" + task.rewardCoins + " Coins & +" + task.rewardSpins + " Spin mila!", Toast.LENGTH_LONG).show();
        }).addOnFailureListener(e ->
                Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_SHORT).show()
        );
    }

    private String getTodayDate() {
        return new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(new Date());
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (userListener != null) userListener.remove();
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/SpinWheelView.java
package com.task.app;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.DecelerateInterpolator;

import java.util.Random;

public class SpinWheelView extends View {

    public interface SpinResultListener {
        void onSpinFinished(int prizeCoins);
    }

    private final int[] prizes = {10, 50, 5, 100, 20, 15, 30, 75};
    private final int[] sliceColors = {
            Color.parseColor("#4F46E5"),
            Color.parseColor("#F59E0B"),
            Color.parseColor("#10B981"),
            Color.parseColor("#EF4444"),
            Color.parseColor("#8B5CF6"),
            Color.parseColor("#06B6D4"),
            Color.parseColor("#EC4899"),
            Color.parseColor("#F97316")
    };

    private final Paint slicePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint centerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pointerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF wheelRect = new RectF();
    private final Path pointerPath = new Path();
    private final Random random = new Random();

    private float currentRotation = 0f;
    private boolean isSpinning = false;

    public SpinWheelView(Context context, AttributeSet attrs) {
        super(context, attrs);
        textPaint.setColor(Color.WHITE);
        textPaint.setTextSize(42f);
        textPaint.setTextAlign(Paint.Align.CENTER);
        textPaint.setFakeBoldText(true);

        borderPaint.setColor(Color.WHITE);
        borderPaint.setStyle(Paint.Style.STROKE);
        borderPaint.setStrokeWidth(8f);

        centerPaint.setColor(Color.WHITE);
        pointerPaint.setColor(Color.parseColor("#111827"));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float w = getWidth();
        float h = getHeight();
        float size = Math.min(w, h) - 40f;
        float cx = w / 2f;
        float cy = h / 2f + 10f;
        float radius = size / 2f;

        wheelRect.set(cx - radius, cy - radius, cx + radius, cy + radius);
        float sweepAngle = 360f / prizes.length;

        for (int i = 0; i < prizes.length; i++) {
            float startAngle = currentRotation + i * sweepAngle;
            slicePaint.setColor(sliceColors[i % sliceColors.length]);
            canvas.drawArc(wheelRect, startAngle, sweepAngle, true, slicePaint);

            double midAngleRad = Math.toRadians(startAngle + sweepAngle / 2f);
            float tx = (float) (cx + (radius * 0.65f) * Math.cos(midAngleRad));
            float ty = (float) (cy + (radius * 0.65f) * Math.sin(midAngleRad)) + 14f;
            canvas.drawText(String.valueOf(prizes[i]), tx, ty, textPaint);
        }

        canvas.drawCircle(cx, cy, radius, borderPaint);
        canvas.drawCircle(cx, cy, 36f, centerPaint);
        slicePaint.setColor(Color.parseColor("#4F46E5"));
        canvas.drawCircle(cx, cy, 24f, slicePaint);

        pointerPath.reset();
        pointerPath.moveTo(cx - 24f, cy - radius - 14f);
        pointerPath.lineTo(cx + 24f, cy - radius - 14f);
        pointerPath.lineTo(cx, cy - radius + 24f);
        pointerPath.close();
        canvas.drawPath(pointerPath, pointerPaint);
    }

    public void spin(SpinResultListener listener) {
        if (isSpinning) return;
        isSpinning = true;

        int targetIndex = random.nextInt(prizes.length);
        float sweepAngle = 360f / prizes.length;
        float targetCenterMod = (270f - (targetIndex * sweepAngle + sweepAngle / 2f));
        targetCenterMod = ((targetCenterMod % 360f) + 360f) % 360f;

        float jitter = (random.nextFloat() - 0.5f) * (sweepAngle * 0.5f);
        float baseMod = ((currentRotation % 360f) + 360f) % 360f;
        float deltaMod = ((targetCenterMod + jitter - baseMod) % 360f + 360f) % 360f;

        float startRot = currentRotation;
        float endRot = startRot + (5 * 360f) + deltaMod;

        ValueAnimator animator = ValueAnimator.ofFloat(startRot, endRot);
        animator.setDuration(4000);
        animator.setInterpolator(new DecelerateInterpolator(2.0f));
        animator.addUpdateListener(anim -> {
            currentRotation = (float) anim.getAnimatedValue();
            invalidate();
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                isSpinning = false;
                if (listener != null) {
                    listener.onSpinFinished(prizes[targetIndex]);
                }
            }
        });
        animator.start();
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/SpinActivity.java
package com.task.app;

import android.app.AlertDialog;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FieldValue;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.ListenerRegistration;

public class SpinActivity extends AppCompatActivity {

    private SpinWheelView spinWheelView;
    private MaterialButton btnSpin;
    private TextView tvSpinsLeft, tvCurrentCoins;

    private FirebaseFirestore db;
    private String uid;
    private ListenerRegistration userListener;
    private long spinsLeft = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_spin);

        FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
        if (user == null) {
            finish();
            return;
        }
        uid = user.getUid();
        db = FirebaseFirestore.getInstance();

        spinWheelView = findViewById(R.id.spinWheelView);
        btnSpin = findViewById(R.id.btnSpin);
        tvSpinsLeft = findViewById(R.id.tvSpinsLeft);
        tvCurrentCoins = findViewById(R.id.tvCurrentCoins);

        findViewById(R.id.btnBack).setOnClickListener(v -> finish());
        btnSpin.setOnClickListener(v -> startSpin());

        userListener = db.collection("users").document(uid)
                .addSnapshotListener((snap, err) -> {
                    if (snap != null && snap.exists()) {
                        Long s = snap.getLong("spinsLeft");
                        Long c = snap.getLong("coins");
                        spinsLeft = s != null ? s : 0;
                        tvSpinsLeft.setText("Available Spins: " + spinsLeft);
                        tvCurrentCoins.setText((c != null ? c : 0) + " Coins");
                    }
                });
    }

    private void startSpin() {
        if (spinsLeft <= 0) {
            Toast.makeText(this, "Spins khatam! Home par ja kar Tasks pure karein.", Toast.LENGTH_LONG).show();
            return;
        }

        btnSpin.setEnabled(false);
        DocumentReference userRef = db.collection("users").document(uid);

        db.runTransaction(transaction -> {
            DocumentSnapshot snap = transaction.get(userRef);
            Long currentSpins = snap.getLong("spinsLeft");
            if (currentSpins == null || currentSpins <= 0) {
                return false;
            }
            transaction.update(userRef, "spinsLeft", currentSpins - 1);
            return true;
        }).addOnSuccessListener(ok -> {
            if (!Boolean.TRUE.equals(ok)) {
                btnSpin.setEnabled(true);
                Toast.makeText(this, "No spins left!", Toast.LENGTH_SHORT).show();
                return;
            }
            spinWheelView.spin(prizeCoins -> {
                userRef.update(
                        "coins", FieldValue.increment(prizeCoins),
                        "totalEarned", FieldValue.increment(prizeCoins)
                ).addOnSuccessListener(unused -> {
                    btnSpin.setEnabled(true);
                    if (!isFinishing()) {
                        new AlertDialog.Builder(this)
                                .setTitle("Badhai Ho!")
                                .setMessage("Aapne Spin mein " + prizeCoins + " Coins jeete hain!")
                                .setPositiveButton("OK", null)
                                .show();
                    }
                });
            });
        }).addOnFailureListener(e -> {
            btnSpin.setEnabled(true);
            Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (userListener != null) userListener.remove();
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/WithdrawAdapter.java
package com.task.app;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;
import java.util.Locale;

public class WithdrawAdapter extends RecyclerView.Adapter<WithdrawAdapter.WithdrawVH> {

    private final List<WithdrawModel> list;

    public WithdrawAdapter(List<WithdrawModel> list) {
        this.list = list;
    }

    @NonNull
    @Override
    public WithdrawVH onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_withdraw, parent, false);
        return new WithdrawVH(v);
    }

    @Override
    public void onBindViewHolder(@NonNull WithdrawVH holder, int position) {
        WithdrawModel m = list.get(position);
        holder.tvAmount.setText(String.format(Locale.getDefault(), "₹%.2f (%d Coins)", m.rupeesAmount, m.coinsUsed));
        holder.tvUpi.setText("UPI: " + m.upiId);
        holder.tvStatus.setText(m.status);
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class WithdrawVH extends RecyclerView.ViewHolder {
        TextView tvAmount, tvUpi, tvStatus;

        WithdrawVH(@NonNull View itemView) {
            super(itemView);
            tvAmount = itemView.findViewById(R.id.tvWAmount);
            tvUpi = itemView.findViewById(R.id.tvWUpi);
            tvStatus = itemView.findViewById(R.id.tvWStatus);
        }
    }
}
EOF

cat << 'EOF' > app/src/main/java/com/task/app/WalletActivity.java
package com.task.app;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FieldValue;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.ListenerRegistration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class WalletActivity extends AppCompatActivity {

    private static final long MIN_WITHDRAW_COINS = 500L;

    private TextView tvWalletCoins, tvWalletRupees, tvNoHistory;
    private TextInputEditText etUpiId, etCoins;
    private MaterialButton btnWithdraw;

    private FirebaseFirestore db;
    private FirebaseUser currentUser;
    private ListenerRegistration userListener;
    private long currentCoins = 0;

    private final List<WithdrawModel> historyList = new ArrayList<>();
    private WithdrawAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wallet);

        currentUser = FirebaseAuth.getInstance().getCurrentUser();
        if (currentUser == null) {
            finish();
            return;
        }
        db = FirebaseFirestore.getInstance();

        tvWalletCoins = findViewById(R.id.tvWalletCoins);
        tvWalletRupees = findViewById(R.id.tvWalletRupees);
        tvNoHistory = findViewById(R.id.tvNoHistory);
        etUpiId = findViewById(R.id.etUpiId);
        etCoins = findViewById(R.id.etCoins);
        btnWithdraw = findViewById(R.id.btnWithdraw);

        RecyclerView rvHistory = findViewById(R.id.rvHistory);
        rvHistory.setLayoutManager(new LinearLayoutManager(this));
        adapter = new WithdrawAdapter(historyList);
        rvHistory.setAdapter(adapter);

        findViewById(R.id.btnBack).setOnClickListener(v -> finish());
        btnWithdraw.setOnClickListener(v -> submitWithdraw());

        userListener = db.collection("users").document(currentUser.getUid())
                .addSnapshotListener((snap, err) -> {
                    if (snap != null && snap.exists()) {
                        Long c = snap.getLong("coins");
                        currentCoins = c != null ? c : 0;
                        double rupees = currentCoins / 10.0;
                        tvWalletCoins.setText(currentCoins + " Coins");
                        tvWalletRupees.setText(String.format(Locale.getDefault(), "Value: ₹%.2f (10 Coins = ₹1)", rupees));
                    }
                });

        loadHistory();
    }

    private void submitWithdraw() {
        String upi = etUpiId.getText() != null ? etUpiId.getText().toString().trim() : "";
        String coinsStr = etCoins.getText() != null ? etCoins.getText().toString().trim() : "";

        if (TextUtils.isEmpty(upi) || !upi.contains("@")) {
            Toast.makeText(this, "Sahi UPI ID daalein (jaise name@upi)", Toast.LENGTH_SHORT).show();
            return;
        }
        if (TextUtils.isEmpty(coinsStr)) {
            Toast.makeText(this, "Coins enter karein", Toast.LENGTH_SHORT).show();
            return;
        }

        long coinsReq;
        try {
            coinsReq = Long.parseLong(coinsStr);
        } catch (NumberFormatException e) {
            Toast.makeText(this, "Invalid coins", Toast.LENGTH_SHORT).show();
            return;
        }

        if (coinsReq < MIN_WITHDRAW_COINS) {
            Toast.makeText(this, "Minimum 500 Coins (₹50) withdraw kar sakte hain", Toast.LENGTH_SHORT).show();
            return;
        }
        if (coinsReq > currentCoins) {
            Toast.makeText(this, "Aapke paas itne Coins nahi hain!", Toast.LENGTH_SHORT).show();
            return;
        }

        btnWithdraw.setEnabled(false);
        DocumentReference userRef = db.collection("users").document(currentUser.getUid());
        DocumentReference reqRef = db.collection("withdraw_requests").document();

        db.runTransaction(transaction -> {
            DocumentSnapshot snap = transaction.get(userRef);
            Long latestCoins = snap.getLong("coins");
            if (latestCoins == null || latestCoins < coinsReq) {
                return false;
            }
            transaction.update(userRef, "coins", latestCoins - coinsReq);

            Map<String, Object> reqData = new HashMap<>();
            reqData.put("uid", currentUser.getUid());
            reqData.put("userName", snap.getString("name"));
            reqData.put("userEmail", currentUser.getEmail());
            reqData.put("upiId", upi);
            reqData.put("coinsUsed", coinsReq);
            reqData.put("rupeesAmount", coinsReq / 10.0);
            reqData.put("status", "Pending");
            reqData.put("createdAt", FieldValue.serverTimestamp());
            transaction.set(reqRef, reqData);
            return true;
        }).addOnSuccessListener(ok -> {
            btnWithdraw.setEnabled(true);
            if (Boolean.TRUE.equals(ok)) {
                etCoins.setText("");
                Toast.makeText(this, "Withdraw request bhej di gayi hai!", Toast.LENGTH_LONG).show();
                loadHistory();
            } else {
                Toast.makeText(this, "Balance kam hai!", Toast.LENGTH_SHORT).show();
            }
        }).addOnFailureListener(e -> {
            btnWithdraw.setEnabled(true);
            Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        });
    }

    private void loadHistory() {
        db.collection("withdraw_requests")
                .whereEqualTo("uid", currentUser.getUid())
                .get()
                .addOnSuccessListener(querySnapshot -> {
                    historyList.clear();
                    for (DocumentSnapshot doc : querySnapshot.getDocuments()) {
                        WithdrawModel m = new WithdrawModel();
                        m.upiId = doc.getString("upiId");
                        Long c = doc.getLong("coinsUsed");
                        Double r = doc.getDouble("rupeesAmount");
                        m.coinsUsed = c != null ? c : 0;
                        m.rupeesAmount = r != null ? r : 0.0;
                        m.status = doc.getString("status");
                        m.createdAt = doc.getTimestamp("createdAt");
                        historyList.add(m);
                    }
                    historyList.sort((a, b) -> {
                        if (a.createdAt == null || b.createdAt == null) return 0;
                        return b.createdAt.compareTo(a.createdAt);
                    });
                    tvNoHistory.setVisibility(historyList.isEmpty() ? View.VISIBLE : View.GONE);
                    adapter.notifyDataSetChanged();
                });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (userListener != null) userListener.remove();
    }
}
EOF

echo "All files created successfully!"