//
//  ViewController.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 26-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController () {
    
    IBOutletCollection(UIButton) NSArray *buttons;
    
}

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    for(UIButton * button in buttons) {
        [[button titleLabel] setFont: font_kc_med(20)];
        if(USING_IPHONE4) {
            CGRect newFrame = button.frame;
            newFrame.origin.y -= 68;
            button.frame = newFrame;
        }
        if(USING_iOS6) {
            CGRect newFrame = button.frame;
            newFrame.origin.y -= 20;
            button.frame = newFrame;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
