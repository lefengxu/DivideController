//
//  LFDivideView.h
//  qian21
//
//  Created by lefengxu on 2017/6/26.
//  Copyright © 2017年 xulefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFDivideView;

@protocol LFDivideViewDelegate <NSObject>

@optional
- (void)divideView:(LFDivideView *)divideView didClickButtonAtIndex:(NSInteger)index;

@end

@interface LFDivideView : UIView

@property (nonatomic, strong) NSArray *titles;  /**<名称*/

@property (nonatomic, weak) id<LFDivideViewDelegate> delegate;

@end
