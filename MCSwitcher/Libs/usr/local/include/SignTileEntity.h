//
//  SignTileEntity.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "TileEntity.h"

@interface SignTileEntity : TileEntity

@property NSMutableArray * lines;

extern NSInteger NUM_LINES;

-(void)setLine:(NSString*) line atIndex:(NSInteger)lineIndex;

@end
