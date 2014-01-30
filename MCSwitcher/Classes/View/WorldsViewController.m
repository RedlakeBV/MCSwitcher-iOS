//
//  WorldsViewController.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "WorldsViewController.h"
#import "MCLevelInfoCell.h"
#import "LevelsController.h"

@interface WorldsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *levelsTableView;

@end

@implementation WorldsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError * error;
    _levels = [[LevelsController shared] loadLevels:&error];
    
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
