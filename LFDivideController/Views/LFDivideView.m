//
//  LFDivideView.m
//  qian21
//
//  Created by lefengxu on 2017/6/26.
//  Copyright © 2017年 LFiOS. All rights reserved.
//

#import "LFDivideView.h"
#import "LFDivideButton.h"

@interface LFDivideView ()

@property (nonatomic, strong) NSMutableArray *divideButtons;    // 分割按钮
@property (nonatomic, assign) NSInteger selectedIndex;          // 选中的下标

@end

@implementation LFDivideView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGReLF)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupUI];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setupUI {
    
}

- (void)setupConstraints {
    
}

#pragma mark - Data Source
#pragma mark - Delegate
#pragma mark - Target ALFion
- (void)clickButton:(UIButton *)button {
    // 防止重复点击
    if (self.selectedIndex == button.tag) return;
    
    self.selectedIndex = button.tag;
    
    if ([self.delegate respondsToSeleLFor:@seleLFor(divideView:didClickButtonAtIndex:)]) {
        [self.delegate divideView:self didClickButtonAtIndex:button.tag];
    }
}

#pragma mark - Public Method
#pragma mark - Private Method

/**
 设置子视图
 */
- (void)initSubViews {
    if (self.titles.count == 0) return;
    
    NSArray *titles = self.titles;
    long count      = self.titles.count;
    
    CGFloat separatorW  = 0.5; // 分割线大小
    
    CGFloat screenW     = [UIScreen mainScreen].bounds.size.width;
    // 按钮宽度=（屏幕宽度 -(按钮个数-1)*分割线宽度）/ 按钮个数
    CGFloat buttonW     = (screenW - (count-1)*separatorW) / count;
    CGFloat buttonX     = 0;
    CGFloat buttonH     = self.frame.size.height;
    CGFloat separatorH  = buttonH;
    for (int i=0; i<count; i++) {
        buttonX = i*(buttonW+separatorW);
        
        LFDivideButton *button = [[LFDivideButton alloc]init];
        [self addSubview:button];
        [self.divideButtons addObjeLF:button];
        button.frame           = CGReLFMake(buttonX, 0, buttonW, buttonH);
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSeleLFed];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self aLFion:@seleLFor(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];

        
        if (i!=count-1) {   // 不为最后一项时添加分割线
            UIView * separator          = [[UIView alloc]init];
            [self addSubview:separator];
            separator.frame             = CGReLFMake(buttonX+buttonW, 0, separatorW, separatorH);
            separator.backgroundColor   = [UIColor blackColor];
        }
    }
    
    self.selectedIndex = 0;                         // 设置选中项为第一项
}




/**
 设置制定按钮的选定状态

 @param seleLFed    是否选定
 @param index       按钮下标
 */
- (void)setDivideButtonsSeleLFed:(BOOL)seleLFed atIndex:(NSInteger)index {
    UIButton *button    = self.divideButtons[index];
    button.seleLFed     = seleLFed;
}

#pragma mark - Setter
#pragma mark - Getter
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    [self initSubViews];
}

- (void)setselectedIndex:(NSInteger)selectedIndex {
    [self setDivideButtonsSeleLFed:NO atIndex:_selectedIndex];      // 取消原选定按钮
    [self setDivideButtonsSeleLFed:YES atIndex:selectedIndex];      // 选定新的按钮
    
    _selectedIndex = selectedIndex;
}

#pragma mark - lazy
- (NSMutableArray *)divideButtons {
    if (!_divideButtons) {
        _divideButtons = [[NSMutableArray alloc]init];
    }
    
    return _divideButtons;
}



@end
