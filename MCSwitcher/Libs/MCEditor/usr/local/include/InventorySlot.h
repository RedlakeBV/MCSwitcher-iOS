//
//  InventorySlot.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemStack.h"

@interface InventorySlot : NSObject

@property Byte slot;
@property ItemStack * contents;

@end
