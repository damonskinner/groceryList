//
//  GroceryListViewController.h
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroceryListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *groceries;
@property (nonatomic, strong) NSArray *groceryKeys;

@end
