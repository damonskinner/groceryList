//
//  RecipeViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "DirectionsViewController.h"
#import "Ingredient.h"


@interface DirectionsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *directionsLabel;

@end

@implementation DirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_wood.png"]];
    
    
    NSLog(@"%@", self.recipeDirections.name);
    self.title = self.recipeDirections.name;
    self.directionsLabel.text=self.recipeDirections.directions;
    
   
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
