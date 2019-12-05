#import "StatusbarUtilPlugin.h"

@implementation StatusbarUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
      FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"statusbar_util" binaryMessenger:[registrar messenger]];
      StatusbarUtilPlugin *instance = [[StatusbarUtilPlugin alloc] init];
      [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"setTranslucent" isEqualToString:call.method]) {
        result(@YES);
    }
}
@end