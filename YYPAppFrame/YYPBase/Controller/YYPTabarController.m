//
//  YYPTabarController.m
//  YYPAppFrame
//
//  Created by 扶摇先生 on 2018/11/4.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "YYPTabarController.h"
#import "YYPHomeController.h"
#import "YYPOtherController.h"
#import "YYPMineController.h"
@interface YYPTabarController ()

@end

@implementation YYPTabarController {
    CGFloat singleLength;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    singleLength = SCREENW/750.0f;
    YYPHomeController *homeVC = [[YYPHomeController alloc] init];
    YYPOtherController *otherVC = [[YYPOtherController alloc] init];
    YYPMineController *mine = [[YYPMineController alloc] init];
    [self addChildVc:homeVC title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home_click"];
    [self addChildVc:otherVC title:@"其他" image:@"tabBar_found" selectedImage:@"tabBar_found_click"];
    [self addChildVc:mine title:@"我的" image:@"tabBar_mine" selectedImage:@"tabBar_mine_click"];

    // Do any additional setup after loading the view.
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20 * singleLength];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20 * singleLength];

    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
