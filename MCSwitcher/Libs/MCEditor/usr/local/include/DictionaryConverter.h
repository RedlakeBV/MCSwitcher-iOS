//
//  DictionaryConverter.h
//  MCEditor
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictionaryConverter <NSObject>

@required
-(NSDictionary*)dictionary;
-(id)initWithDictionary:(NSDictionary*) dictionary;

@end
