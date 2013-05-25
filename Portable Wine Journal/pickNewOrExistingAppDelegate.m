//
//  pickNewOrExistingAppDelegate.m
//  Portable Wine Journal
//
//  Created by Janie Clayton-Hasz on 4/26/13.
//  Copyright (c) 2013 Janie Clayton-Hasz. All rights reserved.
//

#import "pickNewOrExistingAppDelegate.h"

#import "pickNewOrExistingViewController.h"

#import "WineTastingStore.h"

@implementation pickNewOrExistingAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Create a navigation controller and create an instance of the root controller
    pickNewOrExistingViewController *baseViewController = [[pickNewOrExistingViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:baseViewController];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Save the tasting items
    BOOL tastingSuccess = [[WineTastingStore sharedStore] saveTastingChanges];
    
    if (tastingSuccess) {
        NSLog(@"Saved all the tasting items!");
    } else {
        NSLog(@"Was not able to save the tasting items :(");
    }
    
    // Save the wine items
    BOOL wineSuccess = [[WineTastingStore sharedStore] saveWineChanges];
    
    if (wineSuccess) {
        NSLog(@"Saved all the wine items!");
    } else {
        NSLog(@"Was not able to save the wine items :(");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
