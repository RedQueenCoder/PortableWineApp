//
//  NewTastingViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/26/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "NewTastingViewController.h"
#import "NewTasting.h"
#import "WineTastingStore.h"
#import "WineListViewController.h"

// This view is where you create a new tasting. You input the business/winery name and the date is automatically generated.
// These two pieces of information create a key by which the wines from this tasting can be identified
@interface NewTastingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *businessName;
@property (strong, nonatomic) NewTasting *currentTasting;


@end

@implementation NewTastingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        _currentTasting = [[NewTasting alloc] init];
        self.title = @"New Wine Tasting";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createNewTasting:(UIButton *)sender {
    [[[WineTastingStore sharedStore] currentSetOfWines] removeAllObjects];
    self.currentTasting.nameOfBusiness = self.businessName.text;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    self.currentTasting.dateOfTasting = [NSDate date];
    
    // Add new tasting to the Tasting Store
    [[WineTastingStore sharedStore] createTasting:self.currentTasting];
    [[WineTastingStore sharedStore] currentSetOfWineObjects:self.currentTasting];
    
    // Push the view aside for the Wine List view
    WineListViewController *wineListViewController = [[WineListViewController alloc] init];
    [self.navigationController pushViewController:wineListViewController animated:YES];
}


@end
