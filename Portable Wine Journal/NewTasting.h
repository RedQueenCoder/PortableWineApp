//
//  NewTasting.h
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/27/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewTasting : NSObject<NSSecureCoding>

@property (strong, nonatomic) NSString *nameOfBusiness;
@property (strong, nonatomic) NSDate *dateOfTasting;

@end
