//
//  LevelInfoCell.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCLevelInfoCell : UITableViewCell

@property (weak) IBOutlet UIImageView *thumbnailImage;
@property (weak) IBOutlet UILabel *titleLabel;
@property (weak) IBOutlet UILabel *subtitleLabel;

@end
