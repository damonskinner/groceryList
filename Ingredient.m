//
//  Ingredient.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient
-(instancetype)initWithName: (NSString *) name andQuantity: (NSNumber *)quantity andMetric:(NSString *)metric{
    self=[super init];
    
    if (self) {
        _name=name;
        _quantity=quantity;
        _metric=metric;
    }
    
    return self;
}



-(instancetype)init {
    
    return [self initWithName:@"" andQuantity:@0 andMetric:@""];
}
@end
