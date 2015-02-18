//
//  RecipeListTableViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "RecipeListTableViewController.h"
#import "Recipes.h"
#import "RecipeViewController.h"

@interface RecipeListTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation RecipeListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Recipes *firstRecipe = [[Recipes alloc] initWithName:@"Oven Roasted Chicken"
                                          andIngredients:@{@"White Wine":@"1 cup",
                                                           @"Whole Chicken":@"1",
                                                           @"Lemon":@"1"}
                                           andDirections:@"1.  Rub salt and pepper over chicken.  \n2.  Throw it in the oven.  \n3.  ??? \n4.  Profit"];
    Recipes *secondRecipe = [[Recipes alloc] initWithName:@"Bulgogi"
                                           andIngredients:@{@"Soy Sauce":@"1 cup",
                                                            @"Green Onions":@"1",
                                                            @"Sesame Oil":@"1/2 cup",
                                                            @"Flank Steak":@"1 lb."}
                                            andDirections:@"1.  Chop up green onions up.  Slice steak.  \n2.  Combine oil, sliced steak, soy sauce, and onions.  \n3.  ??? \n4.  Profit"];
    Recipes *thirdRecipe = [[Recipes alloc] initWithName:@"Spaghetti with Meat Sauce"
                                          andIngredients:@{@"Tomatoes":@"2",
                                                           @"Tomato Sauce":@"3 cups",
                                                           @"Ground Beef":@"1 lb."}
                                           andDirections:@"1.  Chop tomatoes.  \n2.  Boil spaghetti.  \n3.  ??? \n4.  Profit"];
    Recipes *fourthRecipe = [[Recipes alloc] initWithName:@"Lasagna"
                                           andIngredients:@{@"Ground Beef":@"1 lb.",
                                                            @"Lasagna pasta sheets":@"1 box",
                                                            @"Tomato Sauce":@"2 cups",
                                                            @"Bechamel Sauce":@"2 cups"}
                                            andDirections:@"1.  Chop tomatoes.  \n2.  Boil lasagna sheets.  \n3.  ??? \n4.  Profit"];
    Recipes *fifthRecipe = [[Recipes alloc] initWithName:@"Caesar Salad"
                                          andIngredients:@{@"Tomatoes":@"1",
                                                           @"Chicken Breast":@"1 lb.",
                                                           @"Caesar Dressing":@"1 tablespoon"}
                                           andDirections:@"1.  Chop tomatoes.  \n2.  Grill chicken.  \n3.  ??? \n4.  Profit"];
    Recipes *sixthRecipe = [[Recipes alloc] initWithName:@"Chicken Parmesan"
                                          andIngredients:@{@"Tomatoes":@"1",
                                                           @"Chicken Breast":@"1 lb.",
                                                           @"Grated Parmesan Cheese":@"1 cup",
                                                           @"Breading":@"1 cup"}
                                           andDirections:@"1.  Chop tomatoes.  \n2.  Bread chicken.  \n3.  ??? \n4.  Profit"];
    Recipes *seventhRecipe = [[Recipes alloc] initWithName:@"Steak"
                                            andIngredients:@{@"Flank Steak":@"1 lb.",
                                                             @"Butter":@"1 tablespoon",
                                                             @"Garlic":@"1 clove"}
                                             andDirections:@"1.  Chop garlic.  \n2.  Pan sear steak.  \n3.  ??? \n4.  Profit"];
    
    self.recipeList = [[NSArray alloc] initWithObjects:firstRecipe, secondRecipe, thirdRecipe, fourthRecipe, fifthRecipe, sixthRecipe, seventhRecipe, nil];
    
//    Recipes *tempRecipe = self.recipeList[0];
//    NSLog(@"%@",[tempRecipe.ingredients objectForKey:@"White Wine"]);
    
    
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.recipeList count];
//    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Recipes *tempRecipe= self.recipeList[indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",tempRecipe.name];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath=[self.myTableView indexPathForSelectedRow];
    RecipeViewController *destination=segue.destinationViewController;
    destination.recipeDetails=self.recipeList[indexPath.row];
    
}


@end
