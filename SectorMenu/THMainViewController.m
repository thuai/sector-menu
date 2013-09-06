//
//  THMainViewController.m
//  扇状动画菜单
//
//  Created by thuai on 13-9-2.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import "THMainViewController.h"
#import "THSectorMenu.h"
#import "THOneMenuItem.h"


@interface THMainViewController ()

- (void)onMainMenuClick:(id)sender;

@end

@implementation THMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:0.8]];
    
    THSectorMenu *menu = [[THSectorMenu alloc] initWithFrame:CGRectMake(200, 400, 40, 40) backgroundImage:[UIImage imageNamed:@"menu.png"]];
    [self.view addSubview:menu];
    
    [menu setRotateInterval:0.3];
    
    [menu addTarget:self action:@selector(onMainMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // add sub menu items to main menu
    THOneMenuItem *subMenu1 = [[THOneMenuItem alloc] initWithTitle:@"发起聊天" image:[UIImage imageNamed:@"chat.png"]];
    THOneMenuItem *subMenu2 = [[THOneMenuItem alloc] initWithTitle:@"拨打电话" image:[UIImage imageNamed:@"telephone.png"]];
    THOneMenuItem *subMenu3 = [[THOneMenuItem alloc] initWithTitle:@"发送邮件" image:[UIImage imageNamed:@"mail.png"]];
    THOneMenuItem *subMenu4 = [[THOneMenuItem alloc] initWithTitle:@"扫一扫" image:[UIImage imageNamed:@"erweima.png"]];
    NSArray *subMenus = [NSArray arrayWithObjects:subMenu1, subMenu2, subMenu3, subMenu4, nil];

    [menu setItems:subMenus];
    
    // set menu style
    [menu setMenuStyle:MenuStyleVertical];
}

#pragma mark - Menu event method
- (void)onMainMenuClick:(id)sender
{
//    NSLog(@"main menu clicked!");
}

@end
