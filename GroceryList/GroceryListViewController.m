//
//  GroceryListViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "GroceryListViewController.h"

@interface GroceryListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation GroceryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.groceries = [defaults objectForKey:@"groceryListDictionary"];
    self.groceryKeys = [self.groceries allKeys];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
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
    
    return [self.groceries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    
    cell.textLabel.text=[NSString stringWithFormat:@"%@",self.groceryKeys[indexPath.row]];
    NSDictionary *ingredientDictionary = [self.groceries objectForKey:self.groceryKeys[indexPath.row]];
    
    NSString *quantity=[NSString stringWithFormat:@"%@", ingredientDictionary [@"quantity"]];
    NSString *metric=[NSString stringWithFormat:@"%@", ingredientDictionary [@"metric"]];
    
    NSString *quantityPlusMetric = [NSString stringWithFormat:@"%@ %@",quantity, metric];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",quantityPlusMetric];
    
//    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    
                            
    
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
