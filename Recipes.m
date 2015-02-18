//
//  Recipes.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "Recipes.h"

@implementation Recipes

-(instancetype)initWithName: (NSString *) name andIngredients: (NSDictionary *)ingredients andDirections:(NSString *)directions{
    self=[super init];
    
    if (self) {
        _name=name;
        _ingredients=ingredients;
        _directions=directions;
    }
    
    return self;
}



-(instancetype)init {
    
    return [self initWithName:@"" andIngredients:[[NSDictionary alloc] init] andDirections:@""];
}

@end
