//
//  UserList.h
//  Cirqueorial
//
//  Created by Tom Salu on 03/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserList : NSObject{
    NSInteger *userID;
    NSString *firstName;
    NSString *surname;
    NSString *email;
    NSString *password;
    
}

@property (nonatomic, assign)NSInteger  userID;
@property (nonatomic, retain)NSString   *firstName;
@property (nonatomic, retain)NSString   *surname;
@property (nonatomic, retain)NSString   *email;
@property (nonatomic, retain)NSString   *password;


@end
