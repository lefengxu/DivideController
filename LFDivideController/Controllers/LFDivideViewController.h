//
//  LFDivideViewController.h
//  qian21
//
//  Created by lefengxu on 2017/6/26.
//  Copyright © 2017年 xulefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol LFDivideViewController <NSObjeLF>
//
//
//@end

@interface LFDivideViewController : UIViewController

@property (nonatomic, weak, readonly) UIViewController *currentVc;      /**<当前控制器*/
@property (nonatomic, assign, getter=isCanSwitch) BOOL canSwitch;       /**<是否能切换,默认为YES*/

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers;

@end
