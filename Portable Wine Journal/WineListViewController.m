//
//  WineListViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/28/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "WineListViewController.h"
#import "WineTastingStore.h"
#import "WineInformation.h"
#import "WineInformationViewController.h"

// This is the view controller that can add new wines to a tasting list. This will show what previous wines were tasted and allow you to add new ones.
// This is the only place the wine list can be edited. If you navigate back to the root, you will be prompted to create a new tasting.
// I set this up this way on purpose. Since the date is generated for a specific tasting, there should be no reason to go back and edit the information after you leave.

@interface WineListViewController ()

@end

@implementation WineListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        NSString *title = [[WineTastingStore sharedStore] newestTastingBusiness];
        UINavigationItem *navigationItem = self.navigationItem;
        navigationItem.title = title;
        
        // Create a new bar button item
        UIBarButtonItem *addNewItemBarButton = [[UIBarButtonItem alloc]
                                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                target:self
                                                action:@selector(addNewItem:)];
        
        // Set this bar button as the right item in the navigation bar
        self.navigationItem.rightBarButtonItem = addNewItemBarButton;
        
        // Set a bar button to navigate back to the previous controller
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
    [self.tableView reloadData];
    NSLog(@"Table Data for Wine List View Controller Reloaded!");
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

}
    
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of wines in the current set of wines: %d", [[[WineTastingStore sharedStore] currentSetOfWines] count]);
    return [[[WineTastingStore sharedStore] currentSetOfWines] count];
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
    WineInformation *currentWineItem = [[WineTastingStore sharedStore] currentSetOfWines][indexPath.row];
    NSString *cellLabel = [NSString stringWithFormat:@"%@", [currentWineItem wineName]];
    
    cell.textLabel.text = cellLabel;
    NSLog(@"Cell Label: %@", cellLabel);
    
    return cell;
}

-(void)addNewItem:(id)sender
{    
    WineInformationViewController *wineInformationViewController = [[WineInformationViewController alloc]
                                                                    initWithNibName:@"WineInformationViewController"
                                                                    bundle:nil];
        
    [self.navigationController pushViewController:wineInformationViewController animated:YES];
}

@end
