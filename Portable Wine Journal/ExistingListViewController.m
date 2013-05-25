//
//  ExistingListViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/29/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "ExistingListViewController.h"
#import "WineTastingStore.h"
#import "WineInformation.h"
#import "ListOfWineAttributesViewController.h"

// This is a table view of previously created and tasted wines. This will show your previously saved information and not allow you to edit it.
@interface ExistingListViewController ()

@end

@implementation ExistingListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Custom initialization
        self.title = @"List of Previous Wine Tastings";
    }
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style{
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
    
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WineInformation *currentObject = [[WineTastingStore sharedStore] currentSetOfWines][indexPath.row];
    [[WineTastingStore sharedStore] currentWineObject:currentObject];
    ListOfWineAttributesViewController *viewController = [[ListOfWineAttributesViewController alloc] initWithNibName:@"ListOfWineAttributesViewController" bundle:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
