//
//  UIViewController+LFDivideController.m
//  qian21
//
//  Created by lefengxu on 2017/6/28.
//  Copyright © 2017年 xulefeng. All rights reserved.
//

#import "UIViewController+LFDivideController.h"


@implementation UIViewController (LFDivideController)

- (LFDivideViewController *)divideViewController {
    UIViewController *vc = (UIViewController *)self.parentViewController;
    
    while (vc) {
        if ([vc isKindOfClass:[LFDivideViewController class]]) {
            return (LFDivideViewController *)vc;
        } else if (vc.parentViewController && vc.parentViewController!=vc) {
            vc = vc.parentViewController;
        } else {
            return nil;
        }
    }
    
    return nil;
}

@end
