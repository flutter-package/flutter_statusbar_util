#import "StatusbarUtilPlugin.h"
#import <statusbar_util/statusbar_util-Swift.h>

@implementation StatusbarUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStatusbarUtilPlugin registerWithRegistrar:registrar];
}
@end