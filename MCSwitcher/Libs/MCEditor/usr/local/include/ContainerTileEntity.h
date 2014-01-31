//
//  ContainerTileEntity.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "TileEntity.h"

@interface ContainerTileEntity : TileEntity

// Inventory slots
@property NSArray * items;

/** Get the maximum number of InventorySlots this container can hold. */
-(int)containerSize;

@end
