//
//  CategoryViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 29/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibraryViewController.h"

@interface CategoryViewController : UIViewController
- (IBAction)poiSelection:(id)sender;
- (IBAction)staffSelection:(id)sender;
- (IBAction)diaboloSelection:(id)sender;
- (IBAction)jugglingSelection:(id)sender;

- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)swipeRight:(UISwipeGestureRecognizer *)recognizer;

@property (strong, nonatomic) IBOutlet UIButton *catPoi;
@property (strong, nonatomic) IBOutlet UIButton *catStaff;
@property (strong, nonatomic) IBOutlet UIButton *catDiabolo;
@property (strong, nonatomic) IBOutlet UIButton *catJuggling;

@property (nonatomic, retain) NSString *selection;

@end
