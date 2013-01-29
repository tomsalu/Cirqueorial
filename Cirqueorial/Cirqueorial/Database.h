//
//  Database.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject{

    sqlite3 *db;

}

@property (strong, nonatomic) NSMutableArray *videoArray;

- (NSMutableArray *) getVideo;

@end
