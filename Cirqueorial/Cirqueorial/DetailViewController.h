//
//  DetailViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoList.h"
#import <Parse/Parse.h>

#define kCustomButtonHeight		30.0

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *logo;

//TEXT TUT
@property (strong, nonatomic) IBOutlet UIButton *expandText;
@property (strong, nonatomic) IBOutlet UIWebView *textViewer;

//VIDEO TUT
@property (strong, nonatomic) IBOutlet UIButton *expandVideo;
@property (strong, nonatomic) IBOutlet UIWebView *videoPlayer;

//RATING
@property (strong, nonatomic) IBOutlet UIButton *star1;
@property (strong, nonatomic) IBOutlet UIButton *star2;
@property (strong, nonatomic) IBOutlet UIButton *star3;
@property (strong, nonatomic) IBOutlet UIButton *star4;
@property (strong, nonatomic) IBOutlet UIButton *star5;
@property (strong, nonatomic) IBOutlet UIButton *submitRatingButton;
- (IBAction)submitRating:(id)sender;

//CAN DO BUTTON

- (IBAction)canDo:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *canDoLabel;



//- (void) changeButtonImage:(id) sender;

- (IBAction)changeButtonImage:(id)sender;

@property (strong, nonatomic) VideoList * detailVideo;

- (IBAction)expandVideo:(id)sender;
- (IBAction)expandText:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *scroller;

@property (strong, nonatomic) PFObject *libObject;


@end
