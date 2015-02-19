//
//  AppDelegate.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AppDelegate.h"
#import "Recipes.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
//    Recipes *firstRecipe = [[Recipes alloc] initWithName:@"Oven Roasted Chicken"
//                                          andIngredients:@{@"White Wine":@"1 cup",
//                                                           @"Whole Chicken":@"1",
//                                                           @"Lemon":@"1"}
//                                           andDirections:@"1.  Rub salt and pepper over chicken.  \n2.Throw it in the oven.  \n3.  ??? \n4.  Profit"];
//    Recipes *secondRecipe = [[Recipes alloc] initWithName:@"Bulgogi"
//                                           andIngredients:@{@"Soy Sauce":@"1 cup",
//                                                            @"Green Onions":@"1",
//                                                            @"Sesame Oil":@"1/2 cup",
//                                                            @"Flank Steak":@"1 lb."}
//                                            andDirections:@"1.  Chop up green onions up.  Slice steak.  \n2. Combine oil, sliced steak, soy sauce, and onions.  \n3.  ??? \n4.  Profit"];
//    Recipes *thirdRecipe = [[Recipes alloc] initWithName:@"Spaghetti with Meat Sauce"
//                                          andIngredients:@{@"Tomatoes":@"2",
//                                                           @"Tomato Sauce":@"3 cups",
//                                                           @"Ground Beef":@"1 lb."}
//                                           andDirections:@"1.  Chop tomatoes.  \n2.Boil spaghetti.  \n3.  ??? \n4.  Profit"];
//    Recipes *fourthRecipe = [[Recipes alloc] initWithName:@"Lasagna"
//                                           andIngredients:@{@"Ground Beef":@"1 lb.",
//                                                            @"Lasagna pasta sheets":@"1 box",
//                                                            @"Tomato Sauce":@"2 cups",
//                                                            @"Bechamel Sauce":@"2 cups"}
//                                            andDirections:@"1.  Chop tomatoes.  \n2.Boil lasagna sheets.  \n3.  ??? \n4.  Profit"];
//    Recipes *fifthRecipe = [[Recipes alloc] initWithName:@"Caesar Salad"
//                                          andIngredients:@{@"Tomatoes":@"1",
//                                                           @"Chicken Breast":@"1 lb.",
//                                                           @"Caesar Dressing":@"1 tablespoon"}
//                                           andDirections:@"1.  Chop tomatoes.  \n2.Grill chicken.  \n3.  ??? \n4.  Profit"];
//    Recipes *sixthRecipe = [[Recipes alloc] initWithName:@"Chicken Parmesan"
//                                          andIngredients:@{@"Tomatoes":@"1",
//                                                           @"Chicken Breast":@"1 lb.",
//                                                           @"Grated Parmesan Cheese":@"1 cup",
//                                                           @"Breading":@"1 cup"}
//                                           andDirections:@"1.  Chop tomatoes.  \n2.Bread chicken.  \n3.  ??? \n4.  Profit"];
//    Recipes *seventhRecipe = [[Recipes alloc] initWithName:@"Steak"
//                                            andIngredients:@{@"Flank Steak":@"1 lb.",
//                                                             @"Butter":@"1 tablespoon",
//                                                             @"Garlic":@"1 clove"}
//                                             andDirections:@"1.  Chop garlic.  \n2.Pan sear steak.  \n3.  ??? \n4.  Profit"];
//    
//    self.recipeList = [[NSArray alloc] initWithObjects:firstRecipe, secondRecipe, thirdRecipe, fourthRecipe, fifthRecipe, sixthRecipe, seventhRecipe, nil];
//    
//    Recipes *tempRecipe = self.recipeList[0];
//    NSLog(@"%@",[tempRecipe.ingredients objectForKey:@"White Wine"]);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
