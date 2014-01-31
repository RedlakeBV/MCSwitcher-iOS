//
//  ItemStack.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemStack : NSObject

@property short typeId;
@property short durability;
@property NSInteger amount;

- (id)initWithStackId:(short)typeId durability:(short)durability andAmount:(short)amount;

@end
