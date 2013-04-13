//
//  UserSearchTableController.h
//  Cirqueorial
//
//  Created by Tom Salu on 13/04/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Parse/Parse.h>

@interface UserSearchTableController : PFQueryTableViewController

@property (strong, nonatomic) NSString *usernameSearch;

@end
