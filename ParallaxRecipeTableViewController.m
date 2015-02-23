//
//  RecipeTableViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/22/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "DirectionsViewController.h"
#import "ParallaxRecipeTableViewController.h"
#import "Ingredient.h"

@interface ParallaxRecipeTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addToGrocery:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;



@end

@implementation ParallaxRecipeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView addParallaxWithImage:[UIImage imageNamed:self.recipeDetails.imageName] andHeight:240];
//    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scratchybackground.jpg"]];
    self.view.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_wood.png"]];
    
    
    self.title = self.recipeDetails.name;
//    self.directionsLabel.text=self.recipeDetails.directions;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults boolForKey:self.recipeDetails.name] )
    {
        [self.onOffSwitch setOn:[defaults boolForKey:self.recipeDetails.name]];
    }
    else
    {
        [self.onOffSwitch setOn:NO];
    }
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    return [self.recipeDetails.ingredients count] +1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    if (indexPath.row < [self.recipeDetails.ingredients count]){
        cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
        
        // Configure the cell...
        //    Recipes *tempRecipe= self.recipeList[indexPath.row];
        Ingredient *passedIngredients= self.recipeDetails.ingredients[indexPath.row];
        //    NSString *temp=ingredientNames[indexPath];
        
        NSString *quantityAndMetric=[NSString stringWithFormat:@"%@ %@",passedIngredients.quantity,passedIngredients.metric];
        
        cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",passedIngredients.name];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Chalkduster" size:15];
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",quantityAndMetric];
    } else {
        cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:18];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell = [tableView dequeueReusableCellWithIdentifier:@"directionsCell" forIndexPath:indexPath];
        
    }
    
    
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
    
    if ([segue.identifier isEqualToString:@"directionsSegue"]) {
       
        DirectionsViewController *destination=segue.destinationViewController;
        destination.recipeDirections=self.recipeDetails;
    }
    
}


- (IBAction)addToGrocery:(id)sender
{
    UISwitch *addGrocerySwitch = (UISwitch *)sender;
    
    NSMutableDictionary *groceryListDictionary;
    
    NSMutableDictionary *ingredientsDictionary;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults objectForKey:@"groceryListDictionary"] )
    {
        NSDictionary *immutableGroceryListDictionary = [defaults objectForKey:@"groceryListDictionary"];
        
        groceryListDictionary = [immutableGroceryListDictionary mutableCopy];
    }
    else
    {
        groceryListDictionary = [[NSMutableDictionary alloc] init];
    }
    
    if ( addGrocerySwitch.isOn )
    {
        //add recipeDetails to NSUserDefaults
        for (NSInteger i = 0 ; i < [self.recipeDetails.ingredients count] ; i++ )
        {
            Ingredient *recipeIngredient = self.recipeDetails.ingredients[i];
            
            //if ingredient already exists, get it out of groceryListDictionary,
            //add to it, and put it back in groceryListDictionary
            if ( [groceryListDictionary objectForKey:[recipeIngredient.name capitalizedString]] )
            {
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[[recipeIngredient.name capitalizedString]];
                
                ingredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
                
                NSNumber *quantity = ingredientsDictionary[@"quantity"];
                
                quantity = [NSNumber numberWithInteger:[quantity integerValue] + [recipeIngredient.quantity integerValue]];
                
                ingredientsDictionary[@"quantity"] = quantity;
                
                groceryListDictionary[[recipeIngredient.name capitalizedString]] = ingredientsDictionary;
            }
            else //otherwise, create it and put it in the groceryListDictionary
            {
                ingredientsDictionary = [[NSMutableDictionary alloc] init];
                
                ingredientsDictionary[@"quantity"] = recipeIngredient.quantity;
                ingredientsDictionary[@"metric"] = recipeIngredient.metric;
                
                groceryListDictionary[[recipeIngredient.name capitalizedString]] = ingredientsDictionary;
            }
        }
        
        [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
        
        [defaults setBool:addGrocerySwitch.isOn forKey:self.recipeDetails.name];
        
        [defaults synchronize];
        
        NSLog(@"Data saved");
    }
    else
    {
        //remove recipeDetails from NSUserDefaults
        for (NSInteger i = 0 ; i < [self.recipeDetails.ingredients count] ; i++ )
        {
            Ingredient *recipeIngredient = self.recipeDetails.ingredients[i];
            
            if ( [groceryListDictionary objectForKey:[recipeIngredient.name capitalizedString]] )
            {
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[[recipeIngredient.name capitalizedString]];
                
                NSMutableDictionary *savedIngredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
                
                NSNumber *quantity = savedIngredientsDictionary[@"quantity"];
                
                quantity = [NSNumber numberWithInteger:[quantity integerValue] - [recipeIngredient.quantity integerValue]];
                
                if ( [quantity integerValue] > 0 )
                {
                    savedIngredientsDictionary[@"quantity"] = quantity;
                    
                    groceryListDictionary[[recipeIngredient.name capitalizedString]] = savedIngredientsDictionary;
                }
                else
                {
                    [groceryListDictionary removeObjectForKey:[recipeIngredient.name capitalizedString]];
                }
            }
        }
        
        [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
        
        [defaults setBool:addGrocerySwitch.isOn forKey:self.recipeDetails.name];
        
        [defaults synchronize];
        
        NSLog(@"Data removed");
    }
}

@end
