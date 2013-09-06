//
//  THOneMenuItem.m
//  扇状动画菜单
//
//  Created by thuai on 13-9-3.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import "THOneMenuItem.h"
#import <QuartzCore/QuartzCore.h>

@implementation THOneMenuItem

@synthesize menuTextLabel=_menuTextLabel;
@synthesize menuImageView=_menuImageView;
@synthesize maxSize=_maxSize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:LABLE_TEXT_FONT_SIZE]];
        
        _menuTextLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(0, VSUB_MENUITEM_HEIGHT * 0.2, size.width, size.height)];
        [_menuTextLabel setText:title];
        [_menuTextLabel setFont:[UIFont systemFontOfSize:LABLE_TEXT_FONT_SIZE]];
        [self addSubview:_menuTextLabel];
        
        // set the apperence of text
        [_menuTextLabel.layer setCornerRadius:VText_Layer_CornerRadius];
        [_menuTextLabel setBackgroundColor:[UIColor colorWithRed:144/255.0 green:144/255.0 blue:144/255.0 alpha:1]];
        [_menuTextLabel setTextColor:[UIColor whiteColor]];
        [_menuTextLabel setFont:[UIFont systemFontOfSize:LABLE_TEXT_FONT_SIZE]];
        
        CGPoint center = [_menuTextLabel center];
        center.y = VSUB_MENUITEM_HEIGHT * 0.5;
        [_menuTextLabel setCenter:center];
        
        _menuImageView = [[UIImageView alloc] initWithImage:image];
        [_menuImageView setFrame:CGRectMake(size.width + VTEXT_IMAGE_SPACE, 0,
                                            VSUB_MENUITEM_IMG_WIDTH, VSUB_MENUITEM_IMG_HEIGHT)];

        CGPoint imageCenter = _menuImageView.center;
        imageCenter.y = VSUB_MENUITEM_HEIGHT * 0.5;
        [_menuImageView setCenter:imageCenter];
        
        [self addSubview:_menuImageView];

        // set the frame of menu item
//        CGFloat width = _menuTextLabel.frame.size.width + _menuImageView.frame.size.width + VTEXT_IMAGE_SPACE;
        [self setFrame:CGRectZero];
        
        // hide the sub menu item
        [self setAlpha:0.0];
        
        _maxSize = CGSizeMake(_menuTextLabel.frame.size.width + VTEXT_IMAGE_SPACE + _menuImageView.frame.size.width, VSUB_MENUITEM_HEIGHT);
    }
    return self;
}

@end
