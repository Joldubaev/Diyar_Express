package io.flutter.plugins;

import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
  @Override
  public void onCreate() {
    super.onCreate();
    MapKitFactory.setLocale("ru_RU");
    MapKitFactory.setApiKey("7c6c4061-eb9d-4f05-8acc-b5f5647ef03a");
  }
}