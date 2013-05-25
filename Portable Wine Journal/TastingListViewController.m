//
//  TastingListViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/28/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "TastingListViewController.h"
#import "WineTastingStore.h"
#import "NewTasting.h"
#import "NewTastingViewController.h"
#import "ExistingListViewController.h"


// This is a list of previously created and saved Wine Tastings
@interface TastingListViewController ()

@end

@implementation TastingListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        // NSString *title = [[TastingStore sharedStore] newestTastingBusiness];
        NSString *title = @"Previous Tastings";
        UINavigationItem *navigationItem = self.navigationItem;
        navigationItem.title = title;
        
        // Create a new bar button item
        UIBarButtonItem *addNewItemBarButton = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                target:self
                                                action:@selector(addNewItem:)];
        
        // Set this bar button as the right item in the navigation bar
        self.navigationItem.rightBarButtonItem = addNewItemBarButton;
    }
    
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [[[WineTastingStore sharedStore] tastingObjects] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"UITableViewCell";
    
    // Create an instance of UITableViewCell with default appearance
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // If no reusable cell of this type exists, create a new one
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:reuseIdentifier];
    }
    
    // Create a New Tasting item to contain the information to be displayed
    NewTasting *currentTastingItem = [[[WineTastingStore sharedStore] tastingObjects] objectAtIndex:indexPath.row];
    NSString *cellLabel = [NSString stringWithFormat:@"%@ %@", [currentTastingItem nameOfBusiness], [currentTastingItem dateOfTasting]];
    
    cell.textLabel.text = cellLabel;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewTasting *currentTasting = [[WineTastingStore sharedStore] tastingObjects][indexPath.row];

    [[WineTastingStore sharedStore] currentSetOfWineObjects:currentTasting];
    
    // Navigate to New Tasting View Controller view
    ExistingListViewController *existingListViewController = [[ExistingListViewController alloc] init];
    
    [self.navigationController pushViewController:existingListViewController animated:YES];
}


-(void)addNewItem:(id)sender
{
    // Navigate to New Tasting View Controller view
    NewTastingViewController *newTastingViewController = [[NewTastingViewController alloc] init];
    
    [self.navigationController pushViewController:newTastingViewController animated:YES];

}

@end
