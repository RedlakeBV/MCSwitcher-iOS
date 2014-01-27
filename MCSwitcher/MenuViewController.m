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
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
