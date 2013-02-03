//
//  Database.m
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "Database.h"
#import "VideoList.h"
#import "UserList.h"
#import "FMDatabase.h"

@implementation Database

@synthesize videoArray;
@synthesize userArray;

@synthesize homeDir, fileMgr;


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

- (NSMutableArray *) getUsers{
        
        userArray = [[NSMutableArray alloc] init];
        
        @try {
            
            NSFileManager *fileMgr = [NSFileManager defaultManager];
            NSString *dbPath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"Video_Test_DB.sqlite"];
            BOOL success = [fileMgr fileExistsAtPath:dbPath];
            
            if(!success){
                NSLog(@"TOM GETUSERS ERROR: Cannot locate database at '%@' path", dbPath);
            }
            
            if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)){
                NSLog(@"TOM ERROR: An error has occured.");
            }
            
            NSString *querySQL = @"SELECT rowid, firstName, surname, email, password from users";
            
            const char *sql = [querySQL UTF8String];
            
            sqlite3_stmt *sqlStatement;
            
            int result = sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL);
            
            if(result != SQLITE_OK) {
                NSLog(@"Inside IF Prepare-error #%i: %s", result, sqlite3_errmsg(db));
            }
            
            
            while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                
                UserList *myUser = [[UserList alloc] init];
                
                myUser.userID = sqlite3_column_int(sqlStatement, 0);
                
                myUser.firstName = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
                
                myUser.surname = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
                
                myUser.email = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
                
                myUser.password = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
                
                
                NSLog(@"\nUser ID:%i \nFirstName: %@ \nSurname: %@\nEmail: %@\nPassword: %@\n\n", myUser.userID, myUser.firstName, myUser.surname
                      , myUser.email, myUser.password);
                
                [userArray addObject:myUser];
                
                NSLog(@"%i", SQLITE_ROW);
                
                
                
                
            }
        
        
        
    }
    
    @catch (NSException *exception) {
        NSLog(@"New User Error: An exception occured: %@", [exception reason]);
    }
    
    @finally {
        return userArray;
    }


}

- (void) newUser:(NSString *) pFirstName:(NSString *) pSurname:(NSString *) pEmail:(NSString *) pPassword{
    
    @try {
        
        //Finds the database in the directory, and then opens it for further use.
        NSString *path = [self.GetDocumentDirectory stringByAppendingPathComponent:@"Video_Test_DB.sqlite"];
        FMDatabase *database = [FMDatabase databaseWithPath:path];
        [database open];
        
        
        
        [database executeUpdate:@"insert into users(firstName, surname, email, password) values(?,?,?,?)", pFirstName, pSurname, pEmail, pPassword];

        FMResultSet *results = [database executeQuery:@"select * from users"];
        while([results next]) {
            NSString *first = [results stringForColumn:@"firstName"];
            NSString *surname  = [results stringForColumn:@"surname"];
            NSString *email  = [results stringForColumn:@"email"];
            NSString *pass  = [results stringForColumn:@"password"];
            NSLog(@"User:\n%@ %@\n%@\n%@", first, surname, email, pass);
        }
        
        [database close];
        
    }
    @catch (NSException *exception) {
        NSLog(@"New User Error: An exception occured: %@", [exception reason]);
    }
    
}

-(NSString *)GetDocumentDirectory{
    fileMgr = [NSFileManager defaultManager];
    homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return homeDir;
}



@end
