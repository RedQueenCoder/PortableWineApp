//
//  WineTastingStore.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/28/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "WineTastingStore.h"
#import "WineInformation.h"
#import "NewTasting.h"
#import "WineInformationViewController.h"
#import "NewTastingViewController.h"

@interface WineTastingStore()

// Properties that I want to save to the documents folder
@property (strong, nonatomic, readwrite) NSMutableArray *tastingObjects;
@property (strong, nonatomic, readwrite) NSMutableArray *wineObjects;

// Mutable properties that change and should not be archived
@property (strong, nonatomic, readwrite) NSMutableArray *currentSetOfWines;
@property (strong, nonatomic, readwrite) WineInformation *currentWine;
@property (strong, nonatomic, readwrite) NewTasting *currentTastingObject;

@end

@implementation WineTastingStore

+(WineTastingStore *)sharedStore
{
    static WineTastingStore *store = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        store = [[self alloc] init];
    });
    
    return store;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        NSString *path = [self tastingItemArchivePath];
        _tastingObjects = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!_tastingObjects) {
            _tastingObjects = [[NSMutableArray alloc] init];
        }
        
        path = [self wineItemArchivePath];
        _wineObjects = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!_wineObjects) {
            _wineObjects = [[NSMutableArray alloc] init];
        }
        
        _currentSetOfWines = [[NSMutableArray alloc] init];
        _currentWine = [[WineInformation alloc] init];
        _currentTastingObject = [[NewTasting alloc] init];
    }
    
    return self;
}

-(void)createTasting:(NewTasting *)newTasting
{
    [self.tastingObjects addObject:newTasting];
    self.currentTastingObject = newTasting;
    NSLog(@"New Tasting Created");
}

-(void)createNewWine:(WineInformation *)newWine
{
    [self.wineObjects addObject:newWine];
    NSLog(@"New Wine Created!");
}

-(void)removeTasting:(NewTasting *)tastingToRemove
{
    [self.tastingObjects removeObject:tastingToRemove];
}

-(void)removeWine:(WineInformation *)wineToRemove
{
    [self.wineObjects removeObject:wineToRemove];
}

-(NSDate *)mostRecent
{
    // Create a date object to populate and return
    NSDate *date = [[NSDate alloc] init];
    
    // Set date to the most recent date created in the array
    date = self.currentTastingObject.dateOfTasting;
    
    // Return the date
    NSLog(@"Most Recent Date Set! %@", date);
    return date;
}

-(NSString *)newestTastingBusiness
{
    // Create a string to hold the business name
    NSString *newBusiness = [[NSString alloc] init];
    
    // Set the string to the business name
    newBusiness = self.currentTastingObject.nameOfBusiness;
    
    NSLog(@"Newest Tasting Business set! %@", newBusiness);
    // Return the business name
    return newBusiness;
}

-(void)currentWineObject:(WineInformation *)currentWine
{
    self.currentWine = currentWine;
    NSLog(@"%@", currentWine.wineName);
    NSLog(@"Current Wine set!");
}

-(void)currentSetOfWineObjects:(NewTasting *)currentTastingObject
{
    [self.currentSetOfWines removeAllObjects];
    
    for (WineInformation *wine in self.wineObjects){
        if (wine.businessName == currentTastingObject.nameOfBusiness &&
            wine.tastingDate == currentTastingObject.dateOfTasting) {
            [self.currentSetOfWines addObject:wine];
            NSLog(@"Current Set of Wines loop: %@", wine.wineName);
        }
    }
}



-(NSString *)tastingItemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
    NSString *documentDirectory = documentDirectories[0];
    
    return [documentDirectory stringByAppendingPathComponent:@"tastingItems.archive"];
}

-(NSString *)wineItemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
    NSString *documentDirectory = documentDirectories[0];
    
    return [documentDirectory stringByAppendingPathComponent:@"wineItems.archive"];

}

-(BOOL)saveTastingChanges
{
    
    NSString *path = [self tastingItemArchivePath];
    NSLog(@"%@", path);

    BOOL success = [NSKeyedArchiver archiveRootObject:self.tastingObjects toFile:path];
    NSLog(@"%c", success);
    
    return [NSKeyedArchiver archiveRootObject:self.tastingObjects toFile:path];
}

-(BOOL)saveWineChanges
{
    NSString *path = [self wineItemArchivePath];
    NSLog(@"%@", path);
    
    BOOL success = [NSKeyedArchiver archiveRootObject:self.wineObjects toFile:path];
    NSLog(@"%c", success);
    
    return [NSKeyedArchiver archiveRootObject:self.wineObjects toFile:path];
}

@end
