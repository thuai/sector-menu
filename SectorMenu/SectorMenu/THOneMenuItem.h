//
//  THOneMenuItem.h
//  扇状动画菜单
//
//  Created by thuai on 13-9-3.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LABLE_TEXT_FONT_SIZE 12

/*****************************/
// 竖形菜单
/*****************************/
// 子菜单的宽高
#define VSUB_MENUITEM_WIDTH 100
#define VSUB_MENUITEM_HEIGHT 40
// 子菜单中图片的宽高
#define VSUB_MENUITEM_IMG_WIDTH 40
#define VSUB_MENUITEM_IMG_HEIGHT 40
// 子菜单中图片和文字之间的间距
#define VTEXT_IMAGE_SPACE 10
// 子菜单中文字背景的圆角半径
#define VText_Layer_CornerRadius 5.0

@interface THOneMenuItem : UIView
{
    UILabel *_menuTextLabel;
    UIImageView *_menuImageView;
    CGSize _maxSize;
}

@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, retain) UILabel *menuTextLabel;
@property (nonatomic, retain) UIImageView *menuImageView;

#pragma mark - Initiliza
- (id)initWithTitle:(NSString *)title image:(UIImage *)image;
@end
