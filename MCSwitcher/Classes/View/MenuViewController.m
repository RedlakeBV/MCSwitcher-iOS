//
//  ViewController.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 26-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "MenuViewController.h"
#import "Crumpet.h"
#import "LevelsController.h"

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

- (IBAction)switchLastMapClicked:(id)sender {
    if([DEFAULTS objectForKey:kLastPath]) {
        NSError * err;
        BOOL success = [[LevelsController shared] toggleModeAtPath:[DEFAULTS objectForKey:kLastPath] error:&err];
        if(err) {
            [Crumpet showWithMessage:@"Something went wrong"];
            return;
        } else if(!success) {
            [Crumpet showWithMessage:@"You deleted the last"];
            return;
        }
        
        [Crumpet showWithMessage:@"Last world switched"];
    } else {
        [Crumpet showWithMessage:@"Switch a world first"];
    }
}

@end
