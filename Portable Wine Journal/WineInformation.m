//
//  WineInformation.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/27/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "WineInformation.h"
#import "WineInformationViewController.h"
#import "WineTastingStore.h"

@implementation WineInformation

-(id)init
{
    self = [super init];
    
    if (self) {
        _wineName = [[NSString alloc] init];
        _wineryName = [[NSString alloc] init];
        _fruitType = [[NSString alloc] init];
        _drynessLevel = [[NSString alloc] init];
        _locationOfOrigin = [[NSString alloc] init];
        _vintageYear = [[NSString alloc] init];
        _price = [[NSString alloc] init];
        _personalRating = [[NSString alloc] init];
        _personalNotes = [[NSString alloc] init];
        
        _businessName = [[NSString alloc] init];
        _tastingDate = [[NSDate alloc] init];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        _wineName = [aDecoder decodeObjectOfClass:[NSString class]
                                           forKey:@"wineName"];
        _wineryName = [aDecoder decodeObjectOfClass:[NSString class]
                                             forKey:@"wineryName"];
        _fruitType = [aDecoder decodeObjectOfClass:[NSString class]
                                            forKey:@"fruitType"];
        _drynessLevel = [aDecoder decodeObjectOfClass:[NSString class]
                                               forKey:@"drynessLevel"];
        _locationOfOrigin = [aDecoder decodeObjectOfClass:[NSString class]
                                                   forKey:@"locationOfOrigin"];
        _vintageYear = [aDecoder decodeObjectOfClass:[NSString class]
                                              forKey:@"vintageYear"];
        _price = [aDecoder decodeObjectOfClass:[NSString class]
                                        forKey:@"price"];
        _personalRating = [aDecoder decodeObjectOfClass:[NSString class]
                                                 forKey:@"personalRating"];
        _personalNotes = [aDecoder decodeObjectOfClass:[NSString class]
                                                forKey:@"personalNotes"];
        
        _businessName = [aDecoder decodeObjectOfClass:[NSString class]
                                               forKey:@"businessName"];
        _tastingDate = [aDecoder decodeObjectOfClass:[NSDate class]
                                              forKey:@"tastingDate"];
    }
    
    return self;
}

+(BOOL)supportsSecureCoding
{
    return YES;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.wineName forKey:@"wineName"];
    [aCoder encodeObject:self.wineryName forKey:@"wineryName"];
    [aCoder encodeObject:self.fruitType forKey:@"fruitType"];
    [aCoder encodeObject:self.drynessLevel forKey:@"drynessLevel"];
    [aCoder encodeObject:self.locationOfOrigin forKey:@"locationOfOrigin"];
    [aCoder encodeObject:self.vintageYear forKey:@"vintageYear"];
    [aCoder encodeObject:self.price forKey:@"price"];
    [aCoder encodeObject:self.personalRating forKey:@"personalRating"];
    [aCoder encodeObject:self.personalNotes forKey:@"personalNotes"];
    
    [aCoder encodeObject:self.businessName forKey:@"businessName"];
    [aCoder encodeObject:self.tastingDate forKey:@"tastingDate"];
}

@end
