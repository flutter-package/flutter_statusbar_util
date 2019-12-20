package com.chavesgu.statusbar_util;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.graphics.Color;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** StatusbarUtilPlugin */
public class StatusbarUtilPlugin implements MethodCallHandler {
  private Activity activity;
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "chavesgu/statusbar_util");
    channel.setMethodCallHandler(new StatusbarUtilPlugin(registrar.activity()));
  }

  private StatusbarUtilPlugin(Activity activity) {
    this.activity = activity;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if ("setTranslucent".equals(call.method)) {
      setTranslucentStatus(activity);
      result.success(true);
    } else if (call.method.equals("setStatusBarFont")) {
      String style = call.argument("style");
      setStatusBarStyle(activity, style);
      result.success(true);
    } else {
      result.notImplemented();
    }
  }

  /**
   * 设置状态栏透明
   */
  @TargetApi(19)
  public static void setTranslucentStatus(Activity activity) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      //5.x开始需要把颜色设置透明，否则导航栏会呈现系统默认的浅灰色
      Window window = activity.getWindow();
      View decorView = window.getDecorView();
      //两个 flag 要结合使用，表示让应用的主体内容占用系统状态栏的空间
      int option = View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
              | View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
      decorView.setSystemUiVisibility(option);
      window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
      window.setStatusBarColor(Color.TRANSPARENT);
      //导航栏颜色也可以正常设置
      //window.setNavigationBarColor(Color.TRANSPARENT);
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      Window window = activity.getWindow();
      WindowManager.LayoutParams attributes = window.getAttributes();
      int flagTranslucentStatus = WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS;
      attributes.flags |= flagTranslucentStatus;
      //int flagTranslucentNavigation = WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION;
      //attributes.flags |= flagTranslucentNavigation;
      window.setAttributes(attributes);
    }
  }
  // 设置状态栏字体颜色  黑 白
  public static void setStatusBarStyle(Activity activity, String style) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
      View decorView = activity.getWindow().getDecorView();
      int uiOptions = decorView.getSystemUiVisibility();
      if (style.equals("black")) {
        Log.w("style","black");
        decorView.setSystemUiVisibility(uiOptions | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
      }
      if (style.equals("white")) {
        Log.w("style","white");
        decorView.setSystemUiVisibility(uiOptions & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
      }
    }
  }
}
