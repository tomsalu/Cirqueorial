//
//  DetailViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoList.h"

#define kCustomButtonHeight		30.0

@class VideoList;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *expandText;
@property (strong, nonatomic) IBOutlet UIWebView *textViewer;

@property (strong, nonatomic) IBOutlet UIButton *expandVideo;
@property (strong, nonatomic) IBOutlet UIWebView *videoPlayer;


@property (strong, nonatomic) IBOutlet UILabel *detailName;

@property (strong, nonatomic) VideoList * detailVideo;

- (IBAction)expandVideo:(id)sender;
- (IBAction)expandText:(id)sender;

@end
