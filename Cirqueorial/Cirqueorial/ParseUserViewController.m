//
//  ParseUserViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 21/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ParseUserViewController.h"

@interface ParseUserViewController ()

@end

@implementation ParseUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {

        // Customize the table

        // The className to query on
        self.className = @"_User";

        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"username";

        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";

        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;

        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;

        // The number of objects to show per page
        self.objectsPerPage = 25;
        
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

@end
