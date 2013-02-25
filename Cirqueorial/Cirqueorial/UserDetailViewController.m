//
//  UserDetailViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 22/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "UserDetailViewController.h"

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

@synthesize userDetailArray;
@synthesize userObject = _userObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.firstName.text = [_userObject objectForKey:@"First_Name"];
    self.surname.text = [_userObject objectForKey:@"Surname"];
    
    NSLog(@"Firstname: %@", self.userObject.objectId);
    
//    NSLog(@"User Detail Page Array: %i", userDetailArray.count);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
