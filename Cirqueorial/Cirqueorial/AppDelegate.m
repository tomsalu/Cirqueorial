//
//  AppDelegate.m
//  Cirqueorial
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "AppDelegate.h"



@implementation AppDelegate

NSString *const FBSessionStateChangedNotification =
    @"uk.ac.aber.SecondFacebookApp:FBSessionStateChangedNotification";



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [FBProfilePictureView class];
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
    
    //Cleans up the app if the authentication gets cut out, e.g. pressing home button at wrong time.
    [FBSession.activeSession handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [FBSession.activeSession close];
}

/*
 *Callback for session changed
 */

- (void)sessionStateChanged:(FBSession *) session
                      state:(FBSessionState) state
                      error:(NSError *) error{
    switch (state) {
        case FBSessionStateOpen:
            if (!error) {
                //We have a valid session
                //NSLog(@"User Session Found");
            
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            break;
            
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:FBSessionStateChangedNotification object:session];
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}

//Opens a Facebook session and optionally shows the login UX.

- (BOOL) openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:
                            @"email",
                            @"user_likes",
                            @"user_location",
                            @"user_birthday",
                            nil];
    
    return [FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:allowLoginUI completionHandler:^(FBSession *session, FBSessionState state, NSError *error){
        [self sessionStateChanged:session state:state error:error];
    }];
}

//If we have a valid session at the time of openURL call, we handle
//Facebook transitions by passing the url argument to handleOpenURL.

-(BOOL) application:(UIApplication *)application
openURL:(NSURL *) url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    //Attempt to extract a token from the url
    return [FBSession.activeSession handleOpenURL:url];
}

- (void) closeSession{
    [FBSession.activeSession closeAndClearTokenInformation];
}





















@end
