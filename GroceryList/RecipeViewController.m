//
//  RecipeViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "RecipeViewController.h"
#import "Ingredient.h"


@interface RecipeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)addToGrocery:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *directionsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    NSLog(@"%@", self.recipeDetails.name);
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    self.title = self.recipeDetails.name;
    self.directionsLabel.text=self.recipeDetails.directions;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults boolForKey:self.recipeDetails.name] )
    {
        [self.onOffSwitch setOn:[defaults boolForKey:self.recipeDetails.name]];
    }
    else
    {
        [self.onOffSwitch setOn:NO];
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return [self.recipeDetails.ingredients count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    Recipes *tempRecipe= self.recipeList[indexPath.row];
    Ingredient *passedIngredients= self.recipeDetails.ingredients[indexPath.row];
//    NSString *temp=ingredientNames[indexPath];
    
    NSString *quantityAndMetric=[NSString stringWithFormat:@"%@ %@",passedIngredients.quantity,passedIngredients.metric];
    
    cell.textLabel.text=[NSString stringWithFormat:@"%@",passedIngredients.name];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",quantityAndMetric];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[recipeIngredient.name];
                
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
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[recipeIngredient.name];
                
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
