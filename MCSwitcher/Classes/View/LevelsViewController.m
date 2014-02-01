//
//  WorldsViewController.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LevelsViewController.h"
#import "MCLevelInfoCell.h"
#import "LevelsController.h"
#import "Crumpet.h"

@interface LevelsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *levelsTableView;

@end

@implementation LevelsViewController
BOOL didLoad;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reloadData];
    didLoad = YES;
}

-(void)viewDidAppear:(BOOL)animated {
    if(!didLoad)
    [self reloadData];
}


-(void)reloadData {

    __block BOOL errorOccured = NO;
    _levels = [[LevelsController shared] loadLevels:^(NSError * error) {
        if(error.code == -1) { // minecraft not installed
            errorOccured = YES;
            UILabel * noMCInstalledLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 270, 150)];
            [noMCInstalledLabel setText:@"You don't have Minecraft installed"];
            [noMCInstalledLabel setFont: font_kc_med(25)];
            [noMCInstalledLabel setBackgroundColor: [UIColor clearColor]];
            [noMCInstalledLabel setTextAlignment: NSTextAlignmentCenter];
            [noMCInstalledLabel setTextColor: [UIColor whiteColor]];
            [noMCInstalledLabel setNumberOfLines:0];
            
            [[self view] addSubview: noMCInstalledLabel];
        }
    }];
    
    if(![_levels count] && !errorOccured) {
        UILabel * noMCInstalledLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 270, 150)];
        [noMCInstalledLabel setText:@"You don't have any maps yet"];
        [noMCInstalledLabel setFont: font_kc_med(25)];
        [noMCInstalledLabel setBackgroundColor: [UIColor clearColor]];
        [noMCInstalledLabel setTextAlignment: NSTextAlignmentCenter];
        [noMCInstalledLabel setTextColor: [UIColor whiteColor]];
        [noMCInstalledLabel setNumberOfLines:0];
        
        [[self view] addSubview: noMCInstalledLabel];
    }
    
    [_levelsTableView reloadData];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MCLevelInfoCell * levelCell = (MCLevelInfoCell*)[tableView cellForRowAtIndexPath: indexPath];
    
    NSError * err;
    Level*level = [_levels objectAtIndex:indexPath.row];
    [[LevelsController shared] toggleMode:level error: &err];
    
    if(!err) {
        if([level gameType] == GameType_Creative) {
            [[levelCell thumbnailImage] setImage:[UIImage imageNamed:@"pickaxe"]];
        } else {
            [[levelCell thumbnailImage] setImage:[UIImage imageNamed:@"survival"]];
        }
        [DEFAULTS setObject:[level rootDirectory] forKey:kLastPath];
        NSString * switchedToString = [level gameType] == GameType_Creative ? @"creative" : @"survival";
        [Crumpet showWithMessage:[NSString stringWithFormat:@"Level switched to %@", switchedToString]];
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_levels count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCLevelInfoCell * levelCell = [tableView dequeueReusableCellWithIdentifier:@"MCLevelInfoCell" forIndexPath: indexPath];
    [levelCell setSelectionStyle: UITableViewCellSelectionStyleNone];
    Level * level = [_levels objectAtIndex: indexPath.row];
    [[levelCell titleLabel] setText: [level levelName]];
    [[levelCell titleLabel] setFont:font_kc_med(16)];
    
    NSDate * lastPlayed = [NSDate dateWithTimeIntervalSince1970: [level lastPlayed]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    [[levelCell subtitleLabel] setText: [formatter stringFromDate:lastPlayed]];
    [[levelCell subtitleLabel] setFont:font_kc_med(14)];
    
    
    if([level gameType] == GameType_Creative) {
        [[levelCell thumbnailImage] setImage:[UIImage imageNamed:@"pickaxe"]];
    } else {
        [[levelCell thumbnailImage] setImage:[UIImage imageNamed:@"survival"]];
    }
    
    return levelCell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

@end
