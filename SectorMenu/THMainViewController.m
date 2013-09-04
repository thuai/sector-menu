//
//  THMainViewController.m
//  扇状动画菜单
//
//  Created by thuai on 13-9-2.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import "THMainViewController.h"
#import "THSectorMenu.h"

@interface THMainViewController ()

- (void)onMainMenuClick:(id)sender;

@end

@implementation THMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor grayColor]];
    
    THSectorMenu *menu = [[THSectorMenu alloc] initWithFrame:CGRectMake(200, 400, 40, 40) backgroundImage:[UIImage imageNamed:@"menu.png"]];
    
    [menu addTarget:self action:@selector(onMainMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:menu];
    
}

#pragma mark - Menu event method
- (void)onMainMenuClick:(id)sender
{
    NSLog(@"main menu clicked!");
}

@end
