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
    Ingredient *salt = [[Ingredient alloc] initWithName:@"Salt"
                                             andQuantity:@2
                                               andMetric:@"tsp."];
    Ingredient *pepper = [[Ingredient alloc] initWithName:@"Pepper"
                                            andQuantity:@2
                                              andMetric:@"tsp."];
    NSArray *ingredientList=@[wholeChicken,whiteWine,lemon,salt,pepper];
    
    Recipes *firstRecipe= [[Recipes alloc] initWithName:@"Oven Roasted Chicken"
                                         andIngredients:ingredientList
                                          andDirections:@"1.  Pre-heat over to 425 degrees.  \n2.  Rub salt and pepper over chicken.  \n3.  Place chicken in baking dish, roast for 15 minutes.\n4.  Pour wine over chicken.  \n5.  Halve lemon and squeeze over chicken.  \n6.  Continue roasting for another 30 minutes."];
    
    
    Ingredient *soySauce = [[Ingredient alloc] initWithName:@"Soy Sauce"
                                                    andQuantity:@4
                                                      andMetric:@"tbsp."];
    Ingredient *greenOnions = [[Ingredient alloc] initWithName:@"Green Onions"
                                                 andQuantity:@3
                                                   andMetric:@""];
    Ingredient *sugar = [[Ingredient alloc] initWithName:@"Sugar"
                                            andQuantity:@3
                                              andMetric:@"tbsp."];
    Ingredient *flankSteak = [[Ingredient alloc] initWithName:@"Flank Steak"
                                             andQuantity:@1
                                               andMetric:@"lb."];
    Ingredient *sesameOil = [[Ingredient alloc] initWithName:@"Sesame Oil"
                                             andQuantity:@2
                                               andMetric:@"tbsp."];
    pepper = [[Ingredient alloc] initWithName:@"Pepper"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    salt = [[Ingredient alloc] initWithName:@"Salt"
                                            andQuantity:@2
                                              andMetric:@"tsp."];
    Ingredient *garlic = [[Ingredient alloc] initWithName:@"Garlic"
                                            andQuantity:@2
                                              andMetric:@"cloves"];
    ingredientList=@[soySauce,greenOnions,flankSteak,sesameOil,sugar,pepper,salt];

    Recipes *secondRecipe = [[Recipes alloc] initWithName:@"Bulgogi"
                                           andIngredients:ingredientList
                                            andDirections:@"1.  Slice beef into 1/8 inch slices.  \n2.  Chop green onions, combine with remaining ingredients in mixing bowl.  \n3.  Marinate beef with mixture for at least 30 minutes, preferably overnight. \n4.  Drain beef, stir fry until light brown.  \n5.  Serve over rice."];
    
    
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
    garlic = [[Ingredient alloc] initWithName:@"Garlic"
                                                   andQuantity:@1
                                                     andMetric:@"clove"];
    Ingredient *celery = [[Ingredient alloc] initWithName:@"Celery"
                                              andQuantity:@1
                                                andMetric:@"cup"];
    Ingredient *butter = [[Ingredient alloc] initWithName:@"Butter"
                                              andQuantity:@2
                                                andMetric:@"tbsp."];
    sugar = [[Ingredient alloc] initWithName:@"Sugar"
                                              andQuantity:@1
                                                andMetric:@"tsp."];
    salt = [[Ingredient alloc] initWithName:@"Salt"
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
    
    
    Ingredient *cucumber = [[Ingredient alloc] initWithName:@"Cucumber"
                                                   andQuantity:@1
                                                     andMetric:@""];
    Ingredient *cherryTomatoes = [[Ingredient alloc] initWithName:@"Cherry Tomatoes"
                                                  andQuantity:@1
                                                    andMetric:@"cup"];
    Ingredient *yellowPepper = [[Ingredient alloc] initWithName:@"Yellow Pepper"
                                                  andQuantity:@1
                                                    andMetric:@""];
    Ingredient *shallot = [[Ingredient alloc] initWithName:@"Shallot"
                                                 andQuantity:@4
                                                   andMetric:@"tbsp."];
    Ingredient *cilantro = [[Ingredient alloc] initWithName:@"Fresh Cilantro"
                                            andQuantity:@2
                                              andMetric:@"tbsp."];
    Ingredient *limeJuice = [[Ingredient alloc] initWithName:@"Lime Juice"
                                            andQuantity:@2
                                              andMetric:@"tbsp."];
    Ingredient *canolaOil= [[Ingredient alloc] initWithName:@"Canola Oil"
                                                andQuantity:@3
                                                  andMetric:@"tsp."];
    Ingredient *honey = [[Ingredient alloc] initWithName:@"Honey"
                                            andQuantity:@2
                                              andMetric:@"tsp."];
    Ingredient *redPepperFlakes = [[Ingredient alloc] initWithName:@"Red Pepper Flakes"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    salt = [[Ingredient alloc] initWithName:@"Salt"
                                            andQuantity:@2
                                              andMetric:@"tsp."];
    pepper = [[Ingredient alloc] initWithName:@"Pepper"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    Ingredient *salmon = [[Ingredient alloc] initWithName:@"Salmon Fillet"
                                            andQuantity:@4
                                              andMetric:@""];
    
    ingredientList=@[cucumber,cherryTomatoes,yellowPepper,shallot,cilantro,limeJuice,canolaOil,honey,redPepperFlakes,salt,pepper,salmon];
    
    Recipes *fourthRecipe = [[Recipes alloc] initWithName:@"Seared Salmon with Cilantro Cucumber Salsa"
                                           andIngredients:ingredientList
                                            andDirections:@"1.  Pre-heat oven to 375 degrees.  \n2.  Peel, seed, and chop cucumber.  Quarter cherry tomatoes.  Seed yellow pepper and julienne.  Chop shallot and cilantro.  \n3.  Combine cucumber, tomatoes, yellow pepper, shallot, and cilantro.  Toss gently to mix.  \n4.  Whisk together lime juice, 2 tsp. canola oil, honey, red pepper, and 1 tsp. salt.\n4.  Pour lime juice mixture over cucumber salad, and mix to coat evenly.  \n5.  Sprinkle salmon with salt and pepper to taste.  Heat remaining oil in large non-stick pan.  \n6.  Cook salmon skin side down until skin is crisp.  \n7.  Remove from pan and place in oven in oven safe pan.  Cook until salmon is cooked through, roughly 8-10 minutes.  \n8.  Remove from oven, serve with cucumber salsa."];
    
    
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
    
    
    salmon = [[Ingredient alloc] initWithName:@"Salmon Fillet"
                                  andQuantity:@1
                                    andMetric:@""];
    salt = [[Ingredient alloc] initWithName:@"Salt"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    pepper = [[Ingredient alloc] initWithName:@"Pepper"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    Ingredient *lime = [[Ingredient alloc] initWithName:@"Lime"
                                                      andQuantity:@1
                                                        andMetric:@""];
    soySauce = [[Ingredient alloc] initWithName:@"Soy Sauce"
                                            andQuantity:@1
                                              andMetric:@"tsp."];
    Ingredient *vinegar = [[Ingredient alloc] initWithName:@"Vinegar"
                                            andQuantity:@2
                                              andMetric:@"tsp."];
    
    ingredientList=@[salmon,salt,pepper,lime,soySauce,vinegar];
    
    Recipes *sixthRecipe = [[Recipes alloc] initWithName:@"Pan Seared Salmon"
                                          andIngredients:ingredientList
                                           andDirections:@"1.  Sprinkle salmon with salt and pepper to taste.  Heat remaining oil in large non-stick pan.  \n2.  Cook salmon skin side down until skin is crisp.  \n3.  Remove from pan and place in oven in oven safe pan.  Cook until salmon is cooked through, roughly 8-10 minutes.  \n4.  While salmon is cooking, combine soy sauce, vinegar, and juice from half a lime for dipping sauce."];
    
    
    
    Ingredient *sirloinSteak = [[Ingredient alloc] initWithName:@"Sirloin Steak"
                                  andQuantity:@1
                                    andMetric:@"lb."];
    butter = [[Ingredient alloc] initWithName:@"Butter"
                                                      andQuantity:@1
                                                        andMetric:@"tbsp."];
    garlic = [[Ingredient alloc] initWithName:@"Garlic"
                                         andQuantity:@1
                                           andMetric:@"clove"];
    salt = [[Ingredient alloc] initWithName:@"Salt"
                                  andQuantity:@1
                                    andMetric:@"tsp."];
    pepper = [[Ingredient alloc] initWithName:@"Pepper"
                                  andQuantity:@1
                                    andMetric:@"tsp."];
    
    ingredientList=@[sirloinSteak,butter,garlic,salt, pepper];
    
    Recipes *seventhRecipe = [[Recipes alloc] initWithName:@"Steak"
                                            andIngredients:ingredientList
                                             andDirections:@"1.  Pre-heat oven to 400 degrees.  \n2.  Sprinkle salt and pepper on both sides of  steak to taste.  \n3.  Heat oil in non-stick oven-safe pan over high heat until shimmering.  \n4.  Sear steak on both sides, roughly 2 minutes each.  \n5.  Remove pan from heat.  \n6.  Crush garlic, and place butter and garlic on top of steak.  \n7.  Finish steak in oven to desired doneness."];
    
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
