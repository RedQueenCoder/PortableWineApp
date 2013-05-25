//
//  NewTasting.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/27/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "NewTasting.h"


@implementation NewTasting

-(id)init
{
    self = [super init];
    
    if (self) {
        _nameOfBusiness = [[NSString alloc] init];
        _dateOfTasting = [[NSDate alloc] init];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        _nameOfBusiness = [aDecoder decodeObjectOfClass:[NSString class]
                                                 forKey:@"businessName"];
        _dateOfTasting = [aDecoder decodeObjectOfClass:[NSDate class]
                                                forKey:@"dateOfTasting"];
    }
    
    return self;
}

+(BOOL)supportsSecureCoding
{
    return YES;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nameOfBusiness forKey:@"businessName"];
    [aCoder encodeObject:self.dateOfTasting forKey:@"dateOfTasting"];
}

@end
