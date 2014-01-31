//
//  TileEntity.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vector3f.h"

@interface TileEntity : NSObject

@property NSString * tileId;
@property Vector3f * location;

@end
