//
//  ViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *publishButton;
- (IBAction)publishButtonAction:(id)sender;
- (IBAction)testButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *authButton;
- (IBAction)authButtonAction:(id)sender;

@end
