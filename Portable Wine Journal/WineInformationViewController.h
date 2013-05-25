//
//  WineInformationViewController.h
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/26/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WineInformation;

@interface WineInformationViewController : UIViewController
        <UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) WineInformation *wineItem;
//@property (copy, nonatomic) void (^dismissBlock)(void);

@end
