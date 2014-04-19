//
//  com_giantrobotlabsAppDelegate.m
//  FitBuddy Gym Pass
//
//  Created by john.neyer on 3/7/14.
//  Copyright (c) 2014 John Neyer. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "FoursquareConstants.h"
#import "Foursquare2.h"
#import "GymPassViewController.h"
@interface AppDelegate ()
{
    UIActivityIndicatorView *activityIndicatorView;
}

@end

@implementation AppDelegate

// Return static shared app delegate
+ (AppDelegate *)sharedAppDelegate {
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:TRUE];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:kTITLEBAR] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];    
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    [Foursquare2 setupFoursquareWithClientId:kFSCLIENTID
                                      secret:kFSCLIENTSECRET
                                 callbackURL:kFSCALLBACKURL];
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if (self.gymPassViewController)
    {
        [self.gymPassViewController showPass:YES];
        
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
