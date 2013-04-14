//
//  ProfileViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 28/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UILabel *surname;
@property (strong, nonatomic) IBOutlet UILabel *username;

@property (strong, nonatomic) NSMutableArray *userDetailArray;
@property (strong, nonatomic) PFUser *userObject;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *followLabel;

@property (strong, nonatomic) IBOutlet UILabel *noTricks;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;

- (IBAction)followButton:(id)sender;

@end
