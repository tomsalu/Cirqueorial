//
//  CommentViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 28/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Parse/Parse.h>
#import "AuthenticationViewController.h"

@interface CommentViewController : PFQueryTableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *commentField;
@property (strong, nonatomic) NSString *ID;

- (IBAction)submitButton:(id)sender;

@end
