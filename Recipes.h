//
//  Recipes.h
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipes : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSString *directions;
@property (nonatomic, strong) NSString *imageName;

//@property (nonatomic, strong) NSArray *recipeList;

-(instancetype)initWithName: (NSString *) name andIngredients: (NSArray *)ingredients andDirections:(NSString *)directions andImageName:(NSString *) imageName;



@end
