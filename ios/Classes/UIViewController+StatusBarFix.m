//
//  UIViewController+UIViewController_StatusBarFix.m
//  Pods
//
//  Created by 顾春文 on 2019/12/23.
//

#import "UIViewController+StatusBarFix.h"

NSString* const kOverlayStyleUpdateNotificationName = @"io.flutter.plugin.platform.SystemChromeOverlayNotificationName";
NSString* const kOverlayStyleUpdateNotificationKey = @"io.flutter.plugin.platform.SystemChromeOverlayNotificationKey";


@implementation UIViewController (StatusBarFix)

static UIStatusBarStyle fixedStatusBarStyle = UIStatusBarStyleDefault;

+ (UIStatusBarStyle)fixedStatusBarStyle {
    return fixedStatusBarStyle;
}

- (void)setupStatusBarFix {
    [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(fixStatusBarAppearance:)
         name:kOverlayStyleUpdateNotificationName
         object:nil
    ];
}

- (void)fixStatusBarAppearance:(NSNotification *)notification {
    NSDictionary<NSString *, NSNumber *> *info = notification.userInfo;
    NSNumber *statusBarStyleKey = [info valueForKeyPath:kOverlayStyleUpdateNotificationKey];
    
    if (@available(iOS 13.0, *)) {
        fixedStatusBarStyle = statusBarStyleKey == 0 ? UIStatusBarStyleDarkContent : UIStatusBarStyleLightContent;
    } else {
        fixedStatusBarStyle = statusBarStyleKey == 0 ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
