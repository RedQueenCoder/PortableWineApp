//
//  WineInformation.h
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/27/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineInformation : NSObject<NSSecureCoding>

@property (strong, nonatomic) NSString *wineryName;
@property (strong, nonatomic) NSString *wineName;
@property (strong, nonatomic) NSString *fruitType;
@property (strong, nonatomic) NSString *drynessLevel;
@property (strong, nonatomic) NSString *locationOfOrigin;
@property (strong, nonatomic) NSString *vintageYear;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *personalRating;
@property (strong, nonatomic) NSString *personalNotes;

@property (strong, nonatomic) NSString *businessName;
@property (strong, nonatomic) NSDate *tastingDate;

@end
