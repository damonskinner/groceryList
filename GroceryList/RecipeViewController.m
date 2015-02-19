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
            if ( [groceryListDictionary objectForKey:recipeIngredient.name] )
            {
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[recipeIngredient.name];
                
                ingredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
                
                NSNumber *quantity = ingredientsDictionary[@"quantity"];
                
                quantity = [NSNumber numberWithInteger:[quantity integerValue] + [recipeIngredient.quantity integerValue]];
                
                ingredientsDictionary[@"quantity"] = quantity;
                
                groceryListDictionary[recipeIngredient.name] = ingredientsDictionary;
            }
            else //otherwise, create it and put it in the groceryListDictionary
            {
                ingredientsDictionary = [[NSMutableDictionary alloc] init];
                
                ingredientsDictionary[@"quantity"] = recipeIngredient.quantity;
                ingredientsDictionary[@"metric"] = recipeIngredient.metric;
                
                groceryListDictionary[recipeIngredient.name] = ingredientsDictionary;
            }
        }
        
        [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
        
        [defaults synchronize];
        
        NSLog(@"Data saved");
    }
    else
    {
        //remove recipeDetails from NSUserDefaults
        for (NSInteger i = 0 ; i < [self.recipeDetails.ingredients count] ; i++ )
        {
            Ingredient *recipeIngredient = self.recipeDetails.ingredients[i];
            
            if ( [groceryListDictionary objectForKey:recipeIngredient.name] )
            {
                NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[recipeIngredient.name];
                
                NSMutableDictionary *savedIngredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
                
                NSNumber *quantity = savedIngredientsDictionary[@"quantity"];
                
                quantity = [NSNumber numberWithInteger:[quantity integerValue] - [recipeIngredient.quantity integerValue]];
                
                if ( [quantity integerValue] > 0 )
                {
                    savedIngredientsDictionary[@"quantity"] = quantity;
                    
                    groceryListDictionary[recipeIngredient.name] = savedIngredientsDictionary;
                }
                else
                {
                    [groceryListDictionary removeObjectForKey:recipeIngredient.name];
                }
            }
        }
        
        [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
        
        [defaults synchronize];
        
        NSLog(@"Data removed");
    }
}



//- (IBAction)addToGrocery:(id)sender {
//    UISwitch *addGrocerySwitch = (UISwitch *)sender;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    if ( addGrocerySwitch.isOn )
//    {
//        NSMutableDictionary *groceryList = [defaults objectForKey:@"groceryDictionary"];
//        
//        if ([groceryList count] ==0) {
//            //add recipe ingredients to empty NSUserDefaults dictionary object
//        
//            NSMutableDictionary *tempGroceryList = [[NSMutableDictionary alloc] init];
//            
//            for (Ingredient *eachIngredient in self.recipeDetails.ingredients)
//            {
//                [tempGroceryList setValue:eachIngredient.quantity forKey:eachIngredient.name];
//            }
//            
//            [defaults setObject:tempGroceryList forKey:@"groceryDictionary"];
//            [defaults synchronize];
//            
//        } else if ([groceryList count] !=0) {
//            NSMutableArray *groceryListKeys = [[groceryList allKeys] mutableCopy];
//            
//            for (Ingredient *eachIngredient in self.recipeDetails.ingredients) {
//                if ([groceryListKeys containsObject:eachIngredient.name]) {
//                    NSInteger temporaryQuantity = [[groceryList objectForKey:eachIngredient.name] integerValue];
//                    NSInteger quantityToAdd = [eachIngredient.quantity integerValue];
//                    NSInteger newQuantity = temporaryQuantity + quantityToAdd;
//                    eachIngredient.quantity=[NSNumber numberWithInteger:newQuantity];
//                    
//                    [groceryList setObject:eachIngredient.quantity forKey:eachIngredient.name];
//                    
//                } else {
//                    [groceryList setObject:eachIngredient.quantity forKey:eachIngredient.name];
//                }
//            }
//        }
//    }
//        
//    else
//    {
//        //remove recipeDetails from NSUserDefaults
//        NSLog(@"Switch is off");
//    }
//    
//}
@end
