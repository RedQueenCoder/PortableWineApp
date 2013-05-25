//
//  WineTastingStore.h
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/28/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewTasting;
@class WineInformation;

@interface WineTastingStore : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *tastingObjects;
@property (strong, nonatomic, readonly) NSMutableArray *wineObjects;
@property (strong, nonatomic, readonly) NSMutableArray *currentSetOfWines;
@property (strong, nonatomic, readonly) WineInformation *currentWine;
@property (strong, nonatomic, readonly) NewTasting *currentTastingObject;

+(WineTastingStore *)sharedStore;

-(void)createTasting:(NewTasting *)newTasting;

-(void)createNewWine:(WineInformation *)newWine;

-(void)removeTasting:(NewTasting *)tastingToRemove;

-(void)removeWine:(WineInformation *)wineToRemove;

-(NSDate *)mostRecent;

-(NSString *)newestTastingBusiness;

-(void)currentSetOfWineObjects:(NewTasting *)currentTastingObject;

-(void)currentWineObject:(WineInformation *)currentWine;

-(NSString *)tastingItemArchivePath;

-(NSString *)wineItemArchivePath;

-(BOOL)saveTastingChanges;

-(BOOL)saveWineChanges;

@end
