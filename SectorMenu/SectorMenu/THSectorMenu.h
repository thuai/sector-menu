//
//  THSectorMenu.h
//  扇状动画菜单
//
//  Created by thuai on 13-9-2.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

/*
 
 
 How to use?
 -------------
 Step1:
 
     Use this method to create a menu and initialize with a UIImage instance.
     - (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)image

// Step2:
//    Set event target for the sector menu, and post notification named 'Main_Menu_Click' macro in the event  method 
 */
#import <UIKit/UIKit.h>

#pragma mark - enum of Menu Style
typedef enum MenuStyle
{
    MenuStyleNone,
    MenuStyleVertical,
    MenuStyleRound,
}MenuStyle;


@class THOneMenuItem;

@interface THSectorMenu : UIButton
{
    // 菜单项
    NSArray *_items;
    BOOL _rotated;
    MenuStyle _menustyle;
    
    NSTimeInterval _rotateInterval;
}

@property (nonatomic, assign) NSTimeInterval rotateInterval;
@property (nonatomic, assign) MenuStyle menustyle;
@property (nonatomic, retain, setter = setItems:) NSArray *items;

// 初始化菜单的同时设置背景图片
- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)image;

// set menu style. vertical or round
- (void)setMenuStyle:(MenuStyle)menuStyle;

@end
