//
//  Database.m
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "Database.h"
#import "VideoList.h"

@implementation Database

@synthesize videoArray;


- (NSMutableArray *) getVideo{
    
    videoArray = [[NSMutableArray alloc] init];
    
    @try {
        
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"Video_Test_DB.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        
        if(!success){
            NSLog(@"TOM ERROR: Cannot locate database at '%@' path", dbPath);
        }
        
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)){
            NSLog(@"TOM ERROR: An error has occured.");
        }
        
        
        const char *sql = "SELECT rowid, Video_Name, Video_URL FROM videoTable";
        sqlite3_stmt *sqlStatement;
      
        int result = sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL);
        
        if(result != SQLITE_OK) {
            NSLog(@"Inside IF Prepare-error #%i: %s", result, sqlite3_errmsg(db));
        }
        
        
        
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
            
            VideoList *myVideo = [[VideoList alloc] init];
            
            myVideo.videoID = sqlite3_column_int(sqlStatement, 0);

            myVideo.videoName = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
            
            myVideo.videoURL = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];

            
            NSLog(@"\nVideo ID:%i \nVideo Name: %@ \nVideo URL: %@\n\n", myVideo.videoID, myVideo.videoName, myVideo.videoURL);
            [videoArray addObject:myVideo];
            NSLog(@"%i", SQLITE_ROW);
            
            
            
            
        }
        
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"TOM ERROR: An exception occured: %@", [exception reason]);
    }
    @finally {
        return videoArray;
    }
    
}

@end
