//
//  ListOfWineAttributesViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/29/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "ListOfWineAttributesViewController.h"
#import "WineTastingStore.h"
#import "WineInformation.h"

// This is the view that will output the previously saved wine data for a specific wine.
@interface ListOfWineAttributesViewController ()

@property (strong, nonatomic) WineInformation *currentWine;
@property (weak, nonatomic) IBOutlet UILabel *wineNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fruitTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *drynessLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationOfOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *vintageYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *personalRatingsLabel;

@property (weak, nonatomic) IBOutlet UILabel *personalNotesLabel;

@end

@implementation ListOfWineAttributesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"ListOfWineAttributesViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _currentWine = [[WineTastingStore sharedStore] currentWine];
        self.title = self.currentWine.wineName;
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.currentWine = [[WineTastingStore sharedStore] currentWine];
    NSString *wineName = self.currentWine.wineName;
    NSString *wineryName = self.currentWine.wineryName;
    NSString *fruitType = self.currentWine.fruitType;
    NSString *drynessLevel = self.currentWine.drynessLevel;
    NSString *locationOfOrigin = self.currentWine.locationOfOrigin;
    NSString *vintageYear = self.currentWine.vintageYear;
    NSString *price = self.currentWine.price;
    NSString *personalRating = self.currentWine.personalRating;
    NSString *personalNotes = self.currentWine.personalNotes;
    
    self.wineNameLabel.text = [NSString stringWithFormat:@"Wine name: %@", wineName];
    self.wineryNameLabel.text = [NSString stringWithFormat:@"Winery name: %@", wineryName];
    self.fruitTypeLabel.text = [NSString stringWithFormat:@"Grape or Fruit Type: %@", fruitType];
    self.drynessLevelLabel.text =[NSString stringWithFormat:@"Dryness Level: %@", drynessLevel];
    self.locationOfOriginLabel.text = [NSString stringWithFormat:@"Location of Origin: %@", locationOfOrigin];
    self.vintageYearLabel.text = [NSString stringWithFormat:@"Vintage year: %@", vintageYear];
    self.priceLabel.text = [NSString stringWithFormat:@"Price of wine: %@", price];
    self.personalRatingsLabel.text = [NSString stringWithFormat:@"Personal Rating: %@", personalRating];
    self.personalNotesLabel.text = [NSString stringWithFormat:@"Personal Notes: %@", personalNotes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

