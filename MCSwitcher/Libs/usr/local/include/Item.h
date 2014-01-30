//
//  Item.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Entity.h"
#import "ItemStack.h"

@interface Item : Entity

@property (nonatomic) ItemStack * itemStack;
@property short health;
@property short age;

@end
