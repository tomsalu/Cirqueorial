//
//  SearchTableViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 13/04/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Parse/Parse.h>

@interface LibSearchTableController : PFQueryTableViewController

@property (strong, nonatomic) NSString  *keywordSearch;
@property int ratingSearch;
@property (strong, nonatomic) NSString *catSearch;

@end
