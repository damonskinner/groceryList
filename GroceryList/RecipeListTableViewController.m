//
//  RecipeListTableViewController.m
//  GroceryList
//
//  Created by Damon Skinner on 2/18/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "RecipeListTableViewController.h"
#import "Recipes.h"
#import "RecipeViewController.h"
#import "Ingredient.h"

@interface RecipeListTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)makeGroceryList:(id)sender;

@end

@implementation RecipeListTableViewController

-(void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    NSLog(@"View will appear");
    [self.myTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Ingredient *wholeChicken = [[Ingredient alloc] initWithName:@"Whole Chicken"
                                                    andQuantity:@1
                                                      andMetric:@""];
    Ingredient *whiteWine = [[Ingredient alloc] initWithName:@"White Wine"
                                                 andQuantity:@1
                                                   andMetric:@"cup"];
    Ingredient *lemon = [[Ingredient alloc] initWithName:@"Lemon"
                                             andQuantity:@1
                                               andMetric:@""];
    NSArray *ingredientList=@[wholeChicken,whiteWine,lemon];
    
    Recipes *firstRecipe= [[Recipes alloc] initWithName:@"Oven Roasted Chicken"
                                         andIngredients:ingredientList
                                          andDirections:@"1.  Rub salt and pepper over chicken.  \n2.  Throw it in the oven.  \n3.  ??? \n4.  Profit"];
    
    
    Ingredient *soySauce = [[Ingredient alloc] initWithName:@"Soy Sauce"
                                                    andQuantity:@2
                                                      andMetric:@"cups"];
    Ingredient *greenOnions = [[Ingredient alloc] initWithName:@"Green Onions"
                                                 andQuantity:@1
                                                   andMetric:@""];
    Ingredient *steak = [[Ingredient alloc] initWithName:@"Flank Steak"
                                             andQuantity:@1
                                               andMetric:@"lb."];
    Ingredient *sesameOil = [[Ingredient alloc] initWithName:@"Sesame Oil"
                                             andQuantity:@3
                                               andMetric:@"tbsp."];
    ingredientList=@[soySauce,greenOnions,steak,sesameOil];

    Recipes *secondRecipe = [[Recipes alloc] initWithName:@"Bulgogi"
                                           andIngredients:ingredientList
                                            andDirections:@"1.  Chop up green onions up.  Slice steak.  \n2.  Combine oil, sliced steak, soy sauce, and onions.  \n3.  ??? \n4.  Profit"];
    
    
    Ingredient *tomato = [[Ingredient alloc] initWithName:@"Tomato"
                                                andQuantity:@1
                                                  andMetric:@""];
    Ingredient *tomatoPaste = [[Ingredient alloc] initWithName:@"Tomato Sauce"
                                                   andQuantity:@2
                                                     andMetric:@"cups"];
    Ingredient *oliveOil = [[Ingredient alloc] initWithName:@"Olive Oil"
                                                   andQuantity:@2
                                                     andMetric:@"tbsp."];
    Ingredient *groundBeef = [[Ingredient alloc] initWithName:@"Ground Beef"
                                             andQuantity:@1
                                               andMetric:@"lb."];
    Ingredient *spaghetti = [[Ingredient alloc] initWithName:@"Spaghetti"
                                                  andQuantity:@1
                                                    andMetric:@"cup"];
    Ingredient *onion = [[Ingredient alloc] initWithName:@"Onion"
                                                   andQuantity:@1
                                                     andMetric:@""];
    Ingredient *garlic = [[Ingredient alloc] initWithName:@"Garlic"
                                                   andQuantity:@1
                                                     andMetric:@"clove"];
    Ingredient *celery = [[Ingredient alloc] initWithName:@"Celery"
                                              andQuantity:@1
                                                andMetric:@"cup"];
    Ingredient *butter = [[Ingredient alloc] initWithName:@"Butter"
                                              andQuantity:@2
                                                andMetric:@"tbsp."];
    Ingredient *sugar = [[Ingredient alloc] initWithName:@"Sugar"
                                              andQuantity:@1
                                                andMetric:@"tsp."];
    Ingredient *salt = [[Ingredient alloc] initWithName:@"Salt"
                                             andQuantity:@1
                                               andMetric:@"tsp."];
    Ingredient *mint = [[Ingredient alloc] initWithName:@"Mint"
                                             andQuantity:@1
                                               andMetric:@"tsp."];
    Ingredient *mushrooms = [[Ingredient alloc] initWithName:@"Mushrooms"
                                             andQuantity:@6
                                               andMetric:@"oz."];
    Ingredient *beefBroth = [[Ingredient alloc] initWithName:@"Beef Broth"
                                             andQuantity:@4
                                               andMetric:@"cups"];
    Ingredient *basil = [[Ingredient alloc] initWithName:@"Basil"
                                             andQuantity:@2
                                               andMetric:@"tsp."];
    
    ingredientList=@[tomato,tomatoPaste,groundBeef,spaghetti, oliveOil, onion, celery, sugar, butter, mint, salt, mushrooms, beefBroth, basil];
    
    Recipes *thirdRecipe = [[Recipes alloc] initWithName:@"Spaghetti with Meat Sauce"
                                          andIngredients:ingredientList
                                           andDirections:@"1.  In a large skillet, warm olive oil over low heat; saute onion, garlic and celery until onion is transparent.  \n\n2.  Stir in butter and increase heat to medium; brown beef until no longer pink. Mix in sugar, 1 teaspoon salt, mint and mushrooms; lower heat and stir for about 3 minutes.  \n\n3.  In a large bowl, combine tomato paste and broth; pour liquid and basil to pot. Simmer over very low heat for about 2 hours, stirring occasionally.  \n\n4.  Bring a large pot of water to a vigorous boil with 3 tablespoons salt and 1 teaspoon olive oil. Slip spaghetti into water holding on to ends until strands soften a bit. Cook over high heat for 7 to 8 minutes only. When properly cooked, raw taste should be gone but still have a firm texture.  \n\n5.  When ready to serve, combine pasta with meat sauce; serve on a warmed platter or bowl topped with parsley and Romano cheese."];
    
    
    tomatoPaste = [[Ingredient alloc] initWithName:@"Tomato Sauce"
                                                   andQuantity:@2
                                                     andMetric:@"cups"];
    groundBeef = [[Ingredient alloc] initWithName:@"Ground Beef"
                                                  andQuantity:@1
                                                    andMetric:@"lb."];
    Ingredient *bechamel = [[Ingredient alloc] initWithName:@"Bechamel Sauce"
                                                  andQuantity:@2
                                                    andMetric:@"cups"];
    Ingredient *lasagnaPasta = [[Ingredient alloc] initWithName:@"Lasagna Pasta"
                                                 andQuantity:@1
                                                   andMetric:@"box"];
    ingredientList=@[tomatoPaste,groundBeef,lasagnaPasta,bechamel];
    
    Recipes *fourthRecipe = [[Recipes alloc] initWithName:@"Lasagna"
                                           andIngredients:ingredientList
                                            andDirections:@"1.  Chop tomatoes.  \n2.  Boil lasagna sheets.  \n3.  Heat tomato sauce.  \n4.  ??? \n4.  Profit"];
    
    
    tomato = [[Ingredient alloc] initWithName:@"Tomato"
                                              andQuantity:@1
                                                andMetric:@""];
    Ingredient *icebergLettuce = [[Ingredient alloc] initWithName:@"Iceberg Lettuce"
                                                andQuantity:@1
                                                  andMetric:@"head"];
    Ingredient *chickenBreast = [[Ingredient alloc] initWithName:@"Chicken Breast"
                                                andQuantity:@1
                                                  andMetric:@"lb."];
    Ingredient *caesarDressing = [[Ingredient alloc] initWithName:@"Caesar Dressing"
                                                     andQuantity:@2
                                                       andMetric:@"tbsp."];
    ingredientList=@[icebergLettuce,chickenBreast,caesarDressing,tomato];

    Recipes *fifthRecipe = [[Recipes alloc] initWithName:@"Caesar Salad"
                                          andIngredients:ingredientList
                                           andDirections:@"1.  Chop tomatoes and lettuce.  \n2.  Grill chicken.  \n3.  ??? \n4.  Profit"];
    
    
    tomato = [[Ingredient alloc] initWithName:@"Tomato"
                                  andQuantity:@1
                                    andMetric:@""];
    Ingredient *parmesanCheese = [[Ingredient alloc] initWithName:@"Grated Parmesan Cheese"
                                                      andQuantity:@1
                                                        andMetric:@"cup"];
    chickenBreast = [[Ingredient alloc] initWithName:@"Chicken Breast"
                                                     andQuantity:@1
                                                       andMetric:@"lb."];
    Ingredient *breadCrumbs = [[Ingredient alloc] initWithName:@"Bread Crumbs"
                                                      andQuantity:@2
                                                        andMetric:@"cups"];
    ingredientList=@[parmesanCheese,chickenBreast,breadCrumbs,tomato];
    
    Recipes *sixthRecipe = [[Recipes alloc] initWithName:@"Chicken Parmesan"
                                          andIngredients:ingredientList
                                           andDirections:@"1.  Chop tomatoes.  \n2.  Bread chicken.  \n3.  ??? \n4.  Profit"];
    
    
    
    steak = [[Ingredient alloc] initWithName:@"Flank Steak"
                                  andQuantity:@1
                                    andMetric:@"lb."];
    butter = [[Ingredient alloc] initWithName:@"Butter"
                                                      andQuantity:@1
                                                        andMetric:@"tbsp."];
    garlic = [[Ingredient alloc] initWithName:@"Garlic"
                                         andQuantity:@1
                                           andMetric:@"clove"];
    ingredientList=@[steak,butter,garlic];
    
    Recipes *seventhRecipe = [[Recipes alloc] initWithName:@"Steak"
                                            andIngredients:ingredientList
                                             andDirections:@"1.  Chop garlic.  \n2.  Pan sear steak.  \n3.  ??? \n4.  Profit"];
    
    self.recipeList = [[NSArray alloc] initWithObjects:firstRecipe, secondRecipe, thirdRecipe, fourthRecipe, fifthRecipe, sixthRecipe, seventhRecipe, nil];
    
//    Recipes *tempRecipe = self.recipeList[0];
//    NSLog(@"%@",[tempRecipe.ingredients objectForKey:@"White Wine"]);
    
    
    self.title=@"Pick a Recipe to Add:";
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
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
    return [self.recipeList count];
//    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Recipes *tempRecipe= self.recipeList[indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",tempRecipe.name];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults boolForKey:tempRecipe.name])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
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
    if ([segue.identifier isEqualToString:@"recipeView"]) {
        NSIndexPath *indexPath=[self.myTableView indexPathForSelectedRow];
        RecipeViewController *destination=segue.destinationViewController;
        destination.recipeDetails=self.recipeList[indexPath.row];
    } else if ([segue.identifier isEqualToString:@"groceryList"]){
        
    }
        

    
    
}


- (IBAction)makeGroceryList:(id)sender {
    
    
}
@end
