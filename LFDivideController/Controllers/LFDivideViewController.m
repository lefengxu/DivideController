//
//  LFDivideViewController.m
//  qian21
//
//  Created by lefengxu on 2017/6/26.
//  Copyright © 2017年 xulefeng. All rights reserved.
//

#import "LFDivideViewController.h"
#import "LFDivideView.h"

#define kDivideHeaderH  45

@interface LFDivideViewController () <LFDivideViewDelegate>

@property (nonatomic, weak) LFDivideView * divideHeader;

@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, weak, readwrite) UIViewController *currentVc;

@end

@implementation LFDivideViewController
#pragma mark - Life Cycle

- (instancetype)init {
    return nil;
}

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers {
    self = [super init];
    
    if (self) {
        self.viewControllers = viewControllers;
        self.titles          = [viewControllers valueForKey:@"title"];
        _canSwitch           = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self addSubViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置控制器头部
    CGFloat screenW     = [UIScreen mainScreen].bounds.size.width;
    LFDivideView *divideHeader = [[LFDivideView alloc]initWithFrame:CGRectMake(0, 0, screenW, kDivideHeaderH)];
    [self.view addSubview:divideHeader];
    divideHeader.titles = self.titles;  // 设置标题
    divideHeader.delegate = self;
    
    self.divideHeader = divideHeader;
    
}


/**
 添加子控制器
 */
- (void)addSubViewControllers {
    NSArray *viewControllers = self.viewControllers;
    CGFloat subViewW = self.view.bounds.size.width;
    CGFloat subViewH = self.view.bounds.size.height - kDivideHeaderH;
    for (UIViewController * vc in viewControllers) {
        vc.view.frame = CGRectMake(0, kDivideHeaderH, subViewW, subViewH);
    }
    
    [self addChildViewController:[viewControllers firstObject]];
    [self.view addSubview:[[viewControllers firstObject] view]];
    self.currentVc = [viewControllers firstObject];
}

#pragma mark - Data Source
#pragma mark - Delegate
- (void)divideView:(LFDivideView *)divideView didClickButtonAtIndex:(NSInteger)index {
    [self replaceCurrentControllerWithIndex:index];
}

#pragma mark - Target Action
#pragma mark - Network Operation
#pragma mark - Public Method
#pragma mark - Private Method
/**
 替换当前控制器

 @param index 控制器下标
 */
- (void)replaceCurrentControllerWithIndex:(NSInteger)index {
    UIViewController *selectedVc = self.viewControllers[index];
    UIViewController *oldVc      = self.currentVc;
    if (selectedVc == oldVc) return;           // 同一控制器则退出
    
    [self addChildViewController:selectedVc];
    
    __weak typeof(self) weakSelf = self;
    [self transitionFromViewController:oldVc
                      toViewController:selectedVc
                              duration:0
                               options:UIViewAnimationOptionTransitionNone
                            animations:nil
                            completion:^(BOOL finished) {
                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                if (finished) {
                                    strongSelf.currentVc = selectedVc;
                                    
                                    [selectedVc didMoveToParentViewController:strongSelf];
                                    [oldVc willMoveToParentViewController:nil];
                                    [oldVc removeFromParentViewController];
                                    
                                    
                                } else {
                                    strongSelf.currentVc = oldVc;
                                }
                            }];
    
}
#pragma mark - Setter
#pragma mark - Getter
- (void)setCanSwitch:(BOOL)canSwitch {
    _canSwitch = canSwitch;
    
    self.divideHeader.userInteractionEnabled = canSwitch;
}


@end
