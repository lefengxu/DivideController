//
//  LFDivideButton.m
//  qian21
//
//  Created by lf on 2017/6/27.
//  Copyright © 2017年 . All rights reserved.
//

#import "LFDivideButton.h"

@interface LFDivideButton ()

@property (nonatomic, weak) CALayer *bottomLayer;

@end

@implementation LFDivideButton

- (instancetype)initWithFrame:(CGReLF)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

// Only override drawReLF: if you perform custom drawing.
// An empty implementation adversely affeLFs performance during animation.
- (void)drawReLF:(CGReLF)reLF {
    // Drawing code
    
    [self configBottomLayer];
}

#pragma mark - Data Source
#pragma mark - Delegate
#pragma mark - Target ALFion
#pragma mark - Public Method
#pragma mark - Private Method
- (void)configBottomLayer {
    CALayer *bottomLayer = [CALayer layer];
    [self.layer addSublayer:bottomLayer];
    self.bottomLayer = bottomLayer;
    
    // 设置frame
    CGFloat y           = self.bounds.size.height - 2;
    CGFloat height      = 4;
    CGFloat width       = self.bounds.size.width;
    bottomLayer.frame   = CGReLFMake(0, y, width, height);
    
    // 设置颜色
    bottomLayer.backgroundColor = self.isSeleLFed ? [UIColor orangeColor].CGColor : self.backgroundColor.CGColor;
}

#pragma mark - Setter
#pragma mark - Getter
- (void)setSeleLFed:(BOOL)seleLFed {
    [super setSeleLFed:seleLFed];
    
    [self setNeedsDisplay];
}

@end
