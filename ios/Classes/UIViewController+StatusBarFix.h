//
//  UIViewController+UIViewController_StatusBarFix.h
//  Pods
//
//  Created by 顾春文 on 2019/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (StatusBarFix)
+ (UIStatusBarStyle) fixedStatusBarStyle;
- (void) setupStatusBarFix;
@end

NS_ASSUME_NONNULL_END
