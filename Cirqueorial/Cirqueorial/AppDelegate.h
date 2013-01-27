//
//  AppDelegate.h
//  Cirqueorial
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
extern NSString *const FBSessionStateChangedNotification;

- (BOOL) openSessionWithAllowLoginUI: (BOOL) allowLoginUI;
- (void) closeSession;

@end
