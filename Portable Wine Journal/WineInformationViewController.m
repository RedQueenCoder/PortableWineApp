//
//  WineInformationViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/26/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "WineInformationViewController.h"
#import "WineTastingStore.h"
#import "WineInformation.h"

// This is the view where the individual wine information is created and saved. 

@interface WineInformationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *wineryName;
@property (weak, nonatomic) IBOutlet UITextField *wineName;
@property (weak, nonatomic) IBOutlet UITextField *fruitType;
@property (weak, nonatomic) IBOutlet UITextField *drynessLevel;
@property (weak, nonatomic) IBOutlet UITextField *locationOrigin;
@property (weak, nonatomic) IBOutlet UITextField *vintageYear;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextField *personalRating;
@property (weak, nonatomic) IBOutlet UITextView *personalNotes;

@end

@implementation WineInformationViewController

-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:@"WineInformationViewController" bundle:nil];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        UINavigationItem *navigationItem = self.navigationItem;
        navigationItem.title = @"New Wine Information";
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                  target:self
                                                                                  action:@selector(save:)];
        self.navigationItem.rightBarButtonItem = doneItem;
        
//            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
//                                                                                        target:self
//                                                                                        action:@selector(cancel:)];
//            self.navigationItem.leftBarButtonItem = cancelItem;
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wineName.delegate = self;
    self.wineryName.delegate = self;
    self.fruitType.delegate = self;
    self.drynessLevel.delegate = self;
    self.locationOrigin.delegate = self;
    self.vintageYear.delegate = self;
    self.price.delegate = self;
    self.personalRating.delegate = self;
    self.personalNotes.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return NO;
//}

//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    
//}

-(void)save:(id)sender
{
    WineInformation *newWine = [[WineInformation alloc] init];
    
    newWine.wineName = self.wineName.text;
    NSLog(@"%@", newWine.wineName);
    
    newWine.wineryName = self.wineryName.text;
    NSLog(@"%@", newWine.wineryName);
    
    newWine.fruitType = self.fruitType.text;
    NSLog(@"%@", newWine.fruitType);
    
    newWine.drynessLevel = self.drynessLevel.text;
    NSLog(@"%@", newWine.drynessLevel);
    
    newWine.locationOfOrigin = self.locationOrigin.text;
    NSLog(@"%@", newWine.locationOfOrigin);
    
    newWine.vintageYear = self.vintageYear.text;
    NSLog(@"%@", newWine.vintageYear);
    
    newWine.price = self.price.text;
    NSLog(@"%@", newWine.price);
    
    newWine.personalRating = self.personalRating.text;
    NSLog(@"%@", newWine.personalRating);
    
    newWine.personalNotes = self.personalNotes.text;
    NSLog(@"%@", newWine.personalNotes);
    
    newWine.businessName = [[WineTastingStore sharedStore] newestTastingBusiness];
    NSLog(@"%@", newWine.businessName);
    
    newWine.tastingDate = [[WineTastingStore sharedStore] mostRecent];
    NSLog(@"%@", newWine.tastingDate);
    
    [[WineTastingStore sharedStore] createNewWine:newWine];
    [[[WineTastingStore sharedStore] currentSetOfWines] addObject:newWine];
    NSLog(@"Number of wines in currentSetOfWines: %lu", (unsigned long)[[[WineTastingStore sharedStore] currentSetOfWines] count]);
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];

}

//-(void)cancel:(id)sender
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

@end
