//
//  Navigation.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "MCNavigationController.h"

@implementation MCNavigationController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.navigationBar.barTintColor = UIColorFromRGB(0x33ad38);

        [self.navigationBar setTitleTextAttributes:
         @{
           UITextAttributeTextColor:[UIColor whiteColor],
           UITextAttributeFont : font_kc_med(17)
           }];
        [[(UIButton*)self.navigationBar.backItem titleLabel] setFont:font_kc_med(15)];
        [self.navigationBar setTintColor: [UIColor whiteColor]];

    }
    return self;
}

@end
