//
//  Ingredient.h
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredient : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *quantity;
@property (nonatomic, strong) NSString *metric;


-(instancetype)initWithName: (NSString *) name andQuantity: (NSNumber *)quantity andMetric:(NSString *)metric;


@end
