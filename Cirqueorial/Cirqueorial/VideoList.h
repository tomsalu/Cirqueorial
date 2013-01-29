//
//  VideoList.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoList : NSObject{
    
NSInteger videoID;
NSString *videoName;
NSString *videoURL;

}

@property (nonatomic, assign)NSInteger  videoID;
@property (nonatomic, retain)NSString   *videoName;
@property (nonatomic, retain)NSString   *videoURL;




@end
