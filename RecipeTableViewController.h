//
//  RecipeTableViewController.h
//  GroceryList
//
//  Created by Damon Skinner on 2/22/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIScrollView+APParallaxHeader.h>
#import "Recipes.h"

@interface RecipeTableViewController : UITableViewController
@property (nonatomic, strong) Recipes *recipeDetails;

@end
