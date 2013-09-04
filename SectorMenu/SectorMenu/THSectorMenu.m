//
//  THSectorMenu.m
//  扇状动画菜单
//
//  Created by thuai on 13-9-2.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import "THSectorMenu.h"

@implementation THSectorMenu

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _rotated = NO;
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateSelected];
        [self setImage:image forState:UIControlStateHighlighted];
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:@"rotateAnimation" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.5];
    
    if (!_rotated) {
        [self setAlpha:0.8];
        [self setTransform:CGAffineTransformMakeRotation(90.0)];
    }
    else
    {
        [self setAlpha:1.0];
        [self setTransform:CGAffineTransformMakeRotation(0.0)];
    }
    _rotated = !_rotated;
    
    [UIView commitAnimations];
    [super touchesEnded:touches withEvent:event];
}
@end
