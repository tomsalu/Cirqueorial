//
//  LibraryViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoList.h"
#import "Database.h"
#import "CategoryViewController.h"


@interface LibraryViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate>{
    
    NSMutableArray *tableVideos;
    
}

@property (strong, nonatomic) NSMutableArray *tableVideos;
@property (nonatomic, retain) NSMutableArray *filteredtableVidoes;
/*
@property (strong, nonatomic) IBOutlet UILabel *tableID;
@property (strong, nonatomic) IBOutlet UILabel *tableName;
@property (strong, nonatomic) IBOutlet UILabel *tableURL;
*/
@property (strong, nonatomic) IBOutlet UITableView *videoTable;
@property(nonatomic, strong) Database * ops;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

- (void) createTable:(NSString *) selection;

@end
