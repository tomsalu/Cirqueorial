//
//  UserViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 03/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserList.h"
#import "Database.h"
#import <Parse/Parse.h>

@interface UserViewController : PFQueryTableViewController <UITableViewDataSource, UITableViewDelegate>{
    
    NSMutableArray *tableUsers;
    
}

@property (strong, nonatomic) NSMutableArray *tableUsers;
/*
 @property (strong, nonatomic) IBOutlet UILabel *tableID;
 @property (strong, nonatomic) IBOutlet UILabel *tableName;
 @property (strong, nonatomic) IBOutlet UILabel *tableURL;
 */
@property (strong, nonatomic) IBOutlet UITableView *userTable;
@property(nonatomic, strong) Database * ops;

- (void) reIndexTable;


@end
