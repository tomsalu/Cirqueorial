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


@property (strong, nonatomic) NSMutableArray *userDetailArray;
@property (strong, nonatomic) PFObject *userObject;

@end
