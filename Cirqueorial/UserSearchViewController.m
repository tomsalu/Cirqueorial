//
//  UserSearchViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 13/04/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "UserSearchViewController.h"
#import "UserSearchTableController.h"

@interface UserSearchViewController ()

@end

@implementation UserSearchViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.usernameSearch) {
        [self.usernameSearch resignFirstResponder];
        
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [[segue destinationViewController] setUsernameSearch:self.usernameSearch.text];
}

@end
