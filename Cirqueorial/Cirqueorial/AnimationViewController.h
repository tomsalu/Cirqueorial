//
//  AnimationViewController.h
//  SecondFacebookApp
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController
- (IBAction)logoutButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;

@property (strong, nonatomic) IBOutlet UIButton *libraryButton;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIButton *profileButton;
@property (strong, nonatomic) UIAlertView *alert;



- (IBAction)swipeActionLeft:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)swipeActionRight:(UISwipeGestureRecognizer *)recognizer;


@property (weak, nonatomic) IBOutlet UILabel *moreText;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapOutlet;



@end
