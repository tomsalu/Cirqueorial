//
//  UserDetailViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 22/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface UserDetailViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UILabel *surname;
@property (strong, nonatomic) IBOutlet UILabel *email;

@property (strong, nonatomic) NSMutableArray *userDetailArray;
@property (strong, nonatomic) PFUser *userObject;

@end
