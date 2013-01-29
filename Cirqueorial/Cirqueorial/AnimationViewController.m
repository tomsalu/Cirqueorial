//
//  AnimationViewController.m
//  SecondFacebookApp
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "AnimationViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController


int locationIndex = 1;

CGPoint location1 = {170,250};
CGPoint location2 = {-100, 150};
CGPoint location3 = {100,100};
CGPoint location4 = {500, 250};




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Main Menu";
}

- (void)viewDidUnload{
    [super viewDidUnload];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeActionLeft:(UISwipeGestureRecognizer *)recognizer{
    
    
    
    if (locationIndex == 1) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location2;
            self.profileButton.center = location3;
            self.libraryButton.center = location4;
            self.settingsButton.center = location1;
        }];
        [UIView commitAnimations];
    }
    
    else if (locationIndex == 2) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location3;
            self.profileButton.center = location4;
            self.libraryButton.center = location1;
            self.settingsButton.center = location2;
        }];
        [UIView commitAnimations];
    }
    else if (locationIndex == 3) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location4;
            self.profileButton.center = location1;
            self.libraryButton.center = location2;
            self.settingsButton.center = location3;
        }];
        [UIView commitAnimations];
    }
    
    else if (locationIndex == 4) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location1;
            self.profileButton.center = location2;
            self.libraryButton.center = location3;
            self.settingsButton.center = location4;
        }];
        [UIView commitAnimations];
    }
    
    if (locationIndex == 4) {
        locationIndex = 1;
    }
    else{
        locationIndex++;
    }
    NSLog(@"Locaton: %i", locationIndex);
    
    
}

- (IBAction)swipeActionRight:(UISwipeGestureRecognizer *)recognizer{
    
    if (locationIndex == 1) {
        locationIndex = 4;
    }
    else{
        locationIndex--;
    }
    
    if (locationIndex == 4) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location4;
            self.profileButton.center = location1;
            self.libraryButton.center = location2;
            self.settingsButton.center = location3;
        }];
        [UIView commitAnimations];
    }
    
    
    else if (locationIndex == 3) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location3;
            self.profileButton.center = location4;
            self.libraryButton.center = location1;
            self.settingsButton.center = location2;
        }];
        [UIView commitAnimations];
    }
    
    else if (locationIndex == 2) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location2;
            self.profileButton.center = location3;
            self.libraryButton.center = location4;
            self.settingsButton.center = location1;
        }];
        [UIView commitAnimations];
    }
    
    else if (locationIndex == 1) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.searchButton.center = location1;
            self.profileButton.center = location2;
            self.libraryButton.center = location3;
            self.settingsButton.center = location4;
        }];
        [UIView commitAnimations];
    }
    
    
    
    NSLog(@"Locaton: %i", locationIndex);
    
    
}

@end
