//
//  pickNewOrExistingViewController.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/26/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "pickNewOrExistingViewController.h"
#import "WineTastingStore.h"
#import "NewTastingViewController.h"
#import "ExistingListViewController.h"
#import "TastingListViewController.h"

// This is the root view controller. This will determine if you are creating a new tasting or looking at a previous one
@interface pickNewOrExistingViewController ()

@end

@implementation pickNewOrExistingViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.title = @"New or Existing Tasting";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newTasting:(UIButton *)sender {
    // Navigate to New Tasting View Controller view
    NewTastingViewController *newTastingViewController = [[NewTastingViewController alloc] init];
    
    [self.navigationController pushViewController:newTastingViewController animated:YES];
}

- (IBAction)previousTasting:(UIButton *)sender {
    // Navigate to Tasting List view
    NSLog(@"One");
    TastingListViewController *tastingViewController = [[TastingListViewController alloc] init];
    
    NSLog(@"Two");
    [self.navigationController pushViewController:tastingViewController animated:YES];
    
    NSLog(@"Three");
}


@end
