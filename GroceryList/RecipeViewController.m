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

- (IBAction)addToGrocery:(id)sender {
//    UISwitch *addGrocerySwitch = (UISwitch *)sender;
//    
//    if ( addGrocerySwitch.isOn )
//    {
//        //add recipeDetails to NSUserDefaults
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        
//        for (NSString *key in self.recipeDetails.ingredients)
//        {
//            //            NSString *ingredientAmount = self.recipeDetails.ingredients];
//        }
//        
//        //        [defaults setObject:firstName forKey:@"firstName"];
//        //        [defaults setObject:lastName forKey:@"lastname"];
//        //        [defaults setInteger:age forKey:@"age"];
//        //        [defaults setObject:imageData forKey:@"image"];
//        
//        [defaults synchronize];
//        
//        NSLog(@"Data saved");    }
//    else
//    {
//        //remove recipeDetails from NSUserDefaults
//        NSLog(@"Switch is off");
//    
//    
}
@end
