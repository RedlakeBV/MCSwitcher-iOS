//
//  LevelInfoCell.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCLevelInfoCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *thumbnailImage;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *subtitleLabel;
}

@end
