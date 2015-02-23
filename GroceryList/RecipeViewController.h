//
//  RecipeViewController.h
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipes.h"

@interface RecipeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) Recipes *recipeDirections;



@end
