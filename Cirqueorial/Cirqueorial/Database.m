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
        
        
        //const char *sql = "SELECT rowid, Video_Name, Video_URL FROM videoTable";
        
        
        
        const char *sql = "SELECT rowid, Video_Name, Video_URL FROM videos";
        
        
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

- (NSMutableArray *) getJugglingVideo:(NSString *) catSQL{
    
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
        
        //NSString *querySQL = @"SELECT rowid, Video_Name, Video_URL FROM videos WHERE video_Category='%@'", catSQL;

        NSString *querySQL = [NSString stringWithFormat:@"SELECT rowid, Video_Name, Video_URL FROM videos WHERE video_Category='%@'", catSQL];
        
        const char *sql = [querySQL UTF8String];

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

- (void) newUser:(NSString *) pFirstName:(NSString *) pSurname:(NSString *) pEmail:(NSString *) pPassword{
    
    NSString *firstName = pFirstName;
    NSString *surname = pSurname;
    NSString *email = pEmail;
    NSString *password = pPassword;
    
    NSLog(@"First Name: %@", firstName);
    NSLog(@"Surname: %@", surname);
    NSLog(@"Email: %@", email);
    NSLog(@"Password: %@", password);
    
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
        
        const char *sql;
        
        sql = "INSERT INTO users VALUES (\"bill\", \"jones\", \"bill@example.com\", \"123\")";
        
        sqlite3_stmt *sqlStatement;
        
        int result = sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL);
        
        
        if(result != SQLITE_OK) {
            NSLog(@"Inside IF Prepare-error #%i: %s", result, sqlite3_errmsg(db));
        }
        
        NSString *querySQL = @"SELECT address, phone FROM contacts";
        
        
        const char *query_stmt = [querySQL UTF8String];
        
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"New User Error: An exception occured: %@", [exception reason]);
    }
    
}



@end
