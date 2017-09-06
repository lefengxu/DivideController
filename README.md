# ProgressBar
带动画的进度条


##用法:  
    ①直接导入文件<br><br>
    ②- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers传入需要分页的控制器<br><br>
    ③使用该方法进行比例的配置<br>
    (void)setRatio:(CGFloat)ratio animated:(BOOL)animated
    
    
##可配置属性
    backgroundBarColor    背景颜色<br>
    progressBarColor      进度条颜色<br>
    insideWith            进度条内边距<br>
    duration              动画时长<br>
