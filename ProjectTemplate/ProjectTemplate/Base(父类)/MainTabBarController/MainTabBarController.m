//
//  MainTabBarController.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//Copyright © 2017年 guolei. All rights reserved.
//

#import "MainTabBarController.h"
#import "GLTabBar.h"
#import "UITabBar+CustomBadge.h"
#import "BaseNavigationViewController.h"

@interface MainTabBarController ()<UITabBarDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC


@end

@implementation MainTabBarController


#pragma mark - ----------   Lifecycle（生命周期） ----------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

#pragma mark - ---------- Private Methods（私有方法） ----------

#pragma mark initliaze data(初始化数据)
- (void)initliazeData {

    
}
    
#pragma mark config control（布局控件）
- (void)configUI {

    //初始化tabbar
    [self setUpTabBar];
    //添加子控制器
    [self setUpAllChildViewController];
}

#pragma mark ————— 初始化TabBar —————
-(void)setUpTabBar {
    //设置背景色 去掉分割线
    [self setValue:[GLTabBar new] forKey:@"tabBar"];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
    //通过这两个参数来调整badge位置
    //    [self.tabBar setTabIconWidth:29];
    //    [self.tabBar setBadgeTop:9];
}

#pragma mark - ——————— 初始化VC ————————
- (void)setUpAllChildViewController{
    
    _VCS = @[].mutableCopy;
//    HomeViewController *homeVC = [HomeViewController new];
//    [self setupChildViewController:homeVC title:@"首页" imageName:@"zqbhome_home" seleceImageName:@"zqbhome_home_d"];
//
//    GovernmentSerViewController *shopMallVC = [GovernmentSerViewController new];
//    [self setupChildViewController:shopMallVC title:@"政务服务" imageName:@"yjm_home_sctb" seleceImageName:@"yjm_home_sctbc"];
//
//    IntelligenceSerViewController *shopCatVC = [IntelligenceSerViewController new];
//    [self setupChildViewController:shopCatVC title:@"智慧服务" imageName:@"yjm_home_gwctb" seleceImageName:@"yjm_home_gwctbc"];
//
//    MineViewController *mineVC = [MineViewController new];
//    [self setupChildViewController:mineVC title:@"我的" imageName:@"yjmhome_wode" seleceImageName:@"yjmhome_wode_d"];
    
    self.viewControllers = _VCS;
    
}

- (void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName {
    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //未选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KBlackColor,NSFontAttributeName:KSYSTEMFONT(10.0f)} forState:UIControlStateNormal];
    
    //选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KNavBgColor,NSFontAttributeName:KSYSTEMFONT(10.0f)} forState:UIControlStateSelected];
    //包装导航控制器
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:controller];
    
    [_VCS addObject:nav];
}


#pragma mark actions （点击事件）
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //    NSLog(@"选中 %ld",tabBarController.selectedIndex);
    
}

-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow {
    if (isShow) {
        [self.tabBar setBadgeStyle:kCustomBadgeStyleRedDot value:0 atIndex:index];
    }else{
        [self.tabBar setBadgeStyle:kCustomBadgeStyleNone value:0 atIndex:index];
    }
    
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
#pragma mark - ---------- Protocol Methods（代理方法） ----------


@end
