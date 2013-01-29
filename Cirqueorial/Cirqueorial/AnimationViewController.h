//
//  AnimationViewController.h
//  SecondFacebookApp
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *libraryButton;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIButton *profileButton;



- (IBAction)swipeActionLeft:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)swipeActionRight:(UISwipeGestureRecognizer *)recognizer;


@property (weak, nonatomic) IBOutlet UILabel *moreText;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapOutlet;



@end
