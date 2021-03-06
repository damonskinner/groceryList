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
@property (weak, nonatomic) IBOutlet UIImageView *background;

@property (strong, nonatomic) NSArray *arrayMetric;

- (IBAction)addGroceryQuantityAction:(id)sender;

- (IBAction)addGroceryButton:(id)sender;

@end

@implementation AddGroceryListViewController

@synthesize addGroceryQuantity,addGroceryQuantityLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.addGroceryName.delegate = self;
    self.view.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_wood.png"]];
    self.arrayMetric = [[NSArray alloc] initWithObjects:@"---", @"count", @"cup", @"dz.", @"gal.", @"kg.", @"lb.", @"oz.", @"pt.", @"qrt.", @"tbsp.", @"tsp.", nil];
    
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:self.arrayMetric[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:@"Chalkduster"}];
//    
//    return attString;
//    
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Chalkduster" size:25]];
        tView.textColor=[UIColor whiteColor];
        
        [tView setTextAlignment:UITextAlignmentCenter];
        tView.numberOfLines=1;
    }
    // Fill the label text here
    tView.text=[self.arrayMetric objectAtIndex:row];
    return tView;
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.addGroceryName isFirstResponder] && [touch view] != self.addGroceryName) {
        [self.addGroceryName resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

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
    
    //check for alpha and existence
    
    NSString *groceryItemCheck = self.addGroceryName.text;
    
    NSCharacterSet *alphaSet = [NSCharacterSet letterCharacterSet];
//    groceryItemCheck = [groceryItemCheck stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    BOOL valid = [[[groceryItemCheck stringByTrimmingCharactersInSet:alphaSet] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""];
    
    if ( [groceryItemCheck isEqualToString:@""] )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter the name of an item" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ( !valid )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a valid item" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        if ( [groceryListDictionary objectForKey:[self.addGroceryName.text capitalizedString]] )
        {
            NSDictionary *immutableSavedIngredientsDictionary = groceryListDictionary[[self.addGroceryName.text capitalizedString]];
            
            ingredientsDictionary = [immutableSavedIngredientsDictionary mutableCopy];
            
            NSNumber *quantity = ingredientsDictionary[@"quantity"];
            
            quantity = [NSNumber numberWithInteger:[quantity integerValue] + self.addGroceryQuantity.value];
            
            ingredientsDictionary[@"quantity"] = quantity;
            
            groceryListDictionary[[self.addGroceryName.text capitalizedString]] = ingredientsDictionary;
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
            
            groceryListDictionary[[self.addGroceryName.text capitalizedString]] = ingredientsDictionary;
        }
        
        [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
        
        [defaults synchronize];
        
        [[self  navigationController] popViewControllerAnimated:YES];
    }
}

- (IBAction)addGroceryQuantityAction:(id)sender
{
    self.addGroceryQuantityLabel.text = [NSString stringWithFormat:@"%.f",self.addGroceryQuantity.value];
}

@end
