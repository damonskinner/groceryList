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

- (IBAction)clearList:(id)sender;


@end

@implementation GroceryListViewController

-(void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    NSLog(@"View will appear");
    [self.myTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.groceries = [[defaults objectForKey:@"groceryListDictionary"] mutableCopy];
    
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    self.title=@"Grocery List:";
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
    self.groceryKeys = [self.groceries allKeys];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",self.groceryKeys[indexPath.row]];
    NSDictionary *ingredientDictionary = [self.groceries objectForKey:self.groceryKeys[indexPath.row]];
    
    NSString *quantity=[NSString stringWithFormat:@"%@", ingredientDictionary [@"quantity"]];
    NSString *metric=[NSString stringWithFormat:@"%@", ingredientDictionary [@"metric"]];
    
    NSString *quantityPlusMetric = [NSString stringWithFormat:@"%@ %@",quantity, metric];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",quantityPlusMetric];
    
//    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    
                            
    
    return cell;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     // Return NO if you do not want the specified item to be editable.
     return YES;
 }
 


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     // Delete the row from the data source
     self.groceryKeys = [self.groceries allKeys];
     [self.groceries removeObjectForKey:self.groceryKeys[indexPath.row]];
     
     
     NSMutableDictionary *groceryListDictionary=self.groceries;
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     [defaults setObject:groceryListDictionary forKey:@"groceryListDictionary"];
     
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
 }
 

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clearList:(id)sender {
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.groceries = [[defaults objectForKey:@"groceryListDictionary"] mutableCopy];
    
    
    [self.myTableView reloadData];
}
@end
