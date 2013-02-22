//
//  FBRegistrationViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 17/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBRegistrationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inFirstName;
@property (strong, nonatomic) IBOutlet UITextField *inSurname;
@property (strong, nonatomic) IBOutlet UITextField *inUsername;
@property (strong, nonatomic) IBOutlet UITextField *inEmail;

@property (strong, nonatomic) IBOutlet UITextField *inPassword;
@property (strong, nonatomic) IBOutlet UITextField *inConfirmPassword;


@end