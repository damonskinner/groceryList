//
//  RecipeViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "RecipeViewController.h"


@interface RecipeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *directionsLabel;

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
    NSArray *ingredientNames= [self.recipeDetails.ingredients allKeys];
    return [ingredientNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    Recipes *tempRecipe= self.recipeList[indexPath.row];
    NSArray *ingredientNames= [self.recipeDetails.ingredients allKeys];
//    NSString *temp=ingredientNames[indexPath];
    
    cell.textLabel.text=[NSString stringWithFormat:@"%@",ingredientNames[indexPath.row]];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",[self.recipeDetails.ingredients objectForKey:ingredientNames[indexPath.row]]];
    
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

@end
