//
//  Recipes.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "Recipes.h"

@implementation Recipes

-(instancetype)initWithName: (NSString *) name andIngredients: (NSArray *)ingredients andDirections:(NSString *)directions andImageName:(NSString *) imageName {
    self=[super init];
    
    if (self) {
        _name=name;
        _ingredients=ingredients;
        _directions=directions;
        _imageName=imageName;
    }
    
    return self;
}



-(instancetype)init {
    
    return [self initWithName:@"" andIngredients:[[NSArray alloc] init] andDirections:@"" andImageName:@""];
}

@end
