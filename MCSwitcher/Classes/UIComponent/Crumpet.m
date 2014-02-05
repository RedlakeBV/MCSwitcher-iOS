//
//  Crumpets.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 31-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Crumpet.h"

@implementation Crumpet

+(id)shared {
    static id sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setFrame: CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 65, 320, 40)];
    }
    return self;
}

+(void)showWithMessage:(NSString*) message {
    [[Crumpet shared] showWithMessage:message];
}

+(void)dismiss {
    
}

-(void)showWithMessage:(NSString*) message {
    for(UIView *tmpView in [self subviews]) {
        [tmpView removeFromSuperview];
    }
    [self setAlpha: 0.0f];
    [[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject] addSubview: self];
    [self setBackgroundColor: [UIColor whiteColor]];
    
    UILabel * title = [[UILabel alloc] initWithFrame: CGRectMake(25, 0, 270, self.frame.size.height)];
    [title setText: message];
    [title setFont: font_kc_med(15)];
    [title setBackgroundColor: [UIColor clearColor]];
    [title setTextAlignment: NSTextAlignmentCenter];
    [title setTextColor: UIColorFromRGB(green_light)];
    
    [self addSubview: title];
    [UIView animateWithDuration:.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setAlpha: 1.0f];
    } completion:^(BOOL finished) {
//        [self dismiss];
    }];
}

-(void)dismiss {
    [UIView animateWithDuration:.5f delay:1.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setAlpha: 0.0f];
    } completion:^(BOOL finished) {
    }];
}

@end
