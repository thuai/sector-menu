//
//  THSectorMenu.m
//  扇状动画菜单
//
//  Created by thuai on 13-9-2.
//  Copyright (c) 2013年 thuai. All rights reserved.
//

#import "THSectorMenu.h"
#import "THOneMenuItem.h"

/********************/
//竖形菜单
/*********************/
// 每个子菜单之间的底部间距
#define VSubMenuItem_MarginBottom 5
// 每个子菜单项向左移的偏移量
#define VSubMenuItem_MarginRight_Scale 3

@implementation THSectorMenu

@synthesize menustyle=_menustyle;
@synthesize rotateInterval=_rotateInterval;

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _rotated = NO;
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateSelected];
        [self setImage:image forState:UIControlStateHighlighted];
        
        _menustyle = MenuStyleNone;
        
    }
    return self;
}

#pragma mark - Touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
    NSUInteger count = [_items count];
    
    [UIView beginAnimations:@"rotateAnimation" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:_rotateInterval];
    
    if (!_rotated) {
        [self setAlpha:0.8];
        [self setTransform:CGAffineTransformMakeRotation(90.0)];
    }
    else
    {
        [self setAlpha:1.0];
        [self setTransform:CGAffineTransformMakeRotation(0.0)];
    }
    
    [UIView commitAnimations];
    
    for (int i=0; i<count; i++)
    {
        THOneMenuItem *oneItem = [_items objectAtIndex:i];
        
        if ([oneItem alpha] == 0.0)
        {
            CGRect bounds = CGRectMake(0, 0, oneItem.maxSize.width, oneItem.maxSize.height);
            CGFloat x = self.center.x - bounds.size.width * 0.5 - (count - i - 1) * VSubMenuItem_MarginRight_Scale;
            CGFloat y = self.center.y - (count - i) * (oneItem.maxSize.height+VSubMenuItem_MarginBottom);
            CGPoint center = CGPointMake(x , y);
            
            [UIView beginAnimations:@"popAnimation" context:nil];
            [UIView setAnimationBeginsFromCurrentState:YES];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:_rotateInterval];

            [oneItem setBounds:bounds];
            [oneItem setCenter:center];
            [oneItem setAlpha:1.0];
            [oneItem setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
            
            [UIView commitAnimations];
        }
        else
        {
            [UIView beginAnimations:@"popAnimation" context:nil];
            [UIView setAnimationBeginsFromCurrentState:YES];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDuration:_rotateInterval];
            
            [oneItem setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
            [oneItem setBounds:CGRectMake(0, 0, 45, 45)];
            [oneItem setCenter:CGPointMake(self.frame.origin.x, self.frame.origin.y)];
            [oneItem setAlpha:0.0];
            
            [UIView commitAnimations];
        }
    }

    _rotated = !_rotated;
    
    [super touchesEnded:touches withEvent:event];
}

- (void)setItems:(NSArray *)items
{
    if (_items != items)
    {
        _items = items;
        for (THOneMenuItem *item in _items)
        {
            [[self superview] addSubview:item];
            [item setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [item setCenter:self.center];
            [item setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
        }
    }
}

#pragma mark - Set menu style
- (void)setMenuStyle:(MenuStyle)menuStyle
{
    _menustyle = menuStyle;
}

@end
