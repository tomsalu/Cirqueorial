//
//  DetailViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoList.h"

@class VideoList;

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *videoPlayer;


@property (strong, nonatomic) IBOutlet UILabel *detailName;
@property (strong, nonatomic) IBOutlet UILabel *detailURL;
@property (strong, nonatomic) VideoList * detailVideo;


@end
