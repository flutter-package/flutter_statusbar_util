#import "StatusbarUtilPlugin.h"

@implementation StatusbarUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"chavesgu/statusbar_util"
            binaryMessenger:[registrar messenger]];
  StatusbarUtilPlugin* instance = [[StatusbarUtilPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"setStatusBarFont" isEqualToString:call.method]) {
      NSString *style = call.arguments[@"style"];
      if ([@"white" isEqualToString:style]) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
      }
      if ([@"black" isEqualToString:style]) {
          if (@available(iOS 13.0, *)) {
              [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
          } else {
              [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
          }
      }
    } else {
      result(@true);
    }
}

@end
