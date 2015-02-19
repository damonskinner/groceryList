//
//  AddGroceryListViewController.m
//  GroceryList
//
//  Created by Bert Carr on 2/19/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AddGroceryListViewController.h"

@interface AddGroceryListViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addGroceryName;
@property (weak, nonatomic) IBOutlet UIStepper *addGroceryQuantity;
@property (weak, nonatomic) IBOutlet UIPickerView *addGroceryMetric;
@property (weak, nonatomic) IBOutlet UILabel *addGroceryQuantityLabel;

@property (strong, nonatomic) NSArray *arrayMetric;

- (IBAction)addGroceryQuantityAction:(id)sender;

- (IBAction)addGroceryButton:(id)sender;

@end

@implementation AddGroceryListViewController

@synthesize addGroceryQuantity,addGroceryQuantityLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrayMetric = [[NSArray alloc] initWithObjects:@"---", @"cup", @"doz.", @"gal.", @"lb.",@"oz.",@"qrt.", @"tbsp.",@"tsp.", nil];
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return [self.arrayMetric count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.arrayMetric objectAtIndex:row];
}

- (IBAction)addGroceryButton:(id)sender
{
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
    
    if ( [groceryListDictionary objectForKey:self.addGroceryName.text] )
    {
        NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[self.addGroceryName.text];
        
        ingredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
        
        NSNumber *quantity = ingredientsDictionary[@"quantity"];
        
        quantity = [NSNumber numberWithInteger:[quantity integerValue] + self.addGroceryQuantity.value];
        
        ingredientsDictionary[@"quantity"] = quantity;
        
        groceryListDictionary[self.addGroceryName.text] = ingredientsDictionary;
    }
    else //otherwise, create it and put it in the groceryListDictionary
    {
        ingredientsDictionary = [[NSMutableDictionary alloc] init];
        
        ingredientsDictionary[@"quantity"] = [NSNumber numberWithInteger:self.addGroceryQuantity.value];
        
        NSInteger selectedRow = [self.addGroceryMetric selectedRowInComponent:0];
        
        if (selectedRow == 0)
        {
            ingredientsDictionary[@"metric"] = @"";
        }
        else
        {
            ingredientsDictionary[@"metric"] = self.arrayMetric[selectedRow];
        }
        
        groceryListDictionary[self.addGroceryName.text] = ingredientsDictionary;
    }
    
    [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
    
    [defaults synchronize];
    
    [[self  navigationController] popViewControllerAnimated:YES];
}

- (IBAction)addGroceryQuantityAction:(id)sender
{
    self.addGroceryQuantityLabel.text = [NSString stringWithFormat:@"%.f",self.addGroceryQuantity.value];
}

@end
