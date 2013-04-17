//
//  CategoryViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 29/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "CategoryViewController.h"
#import "ParseLibraryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController



int catLocationIndex = 1;

CGPoint catLocation1 = {170,250};
CGPoint catLocation2 = {-300, 150};
CGPoint catLocation3 = {100,100};
CGPoint catLocation4 = {700, 250};


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    catLocationIndex = 1;
    self.navigationItem.title = @"Categories";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"catJuggling"]) {
        // Row selection

        [[segue destinationViewController] setCategoryChosen:@"juggling"];
    }
    else if ([[segue identifier] isEqualToString:@"catStaff"]) {
        // Row selection
        
        [[segue destinationViewController] setCategoryChosen:@"staff"];
    }
    else if ([[segue identifier] isEqualToString:@"catPoi"]) {
        // Row selection
        
        [[segue destinationViewController] setCategoryChosen:@"poi"];
    }
    else if ([[segue identifier] isEqualToString:@"catDiabolo"]) {
        // Row selection
        
        [[segue destinationViewController] setCategoryChosen:@"diabolo"];
    }
    
    /*
     
     catLocationIndex = 1;
     NSLog(@"Segway Location: %i", catLocationIndex);

    if (self.catPoi.highlighted) {

        [lvc createTable:@"poi"];
    }

    if (self.catStaff.highlighted) {
        [lvc createTable:@"staff"];
    }

    if (self.catDiabolo.highlighted) {
        [lvc createTable:@"diabolo"];
    }

    if (self.catJuggling.highlighted) {

        [lvc createTable:@"juggling"];
    }
    */
    
    
    
    
}


- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)recognizer {
    
    if (catLocationIndex == 1) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation2;
            self.catPoi.center = catLocation3;
            self.catJuggling.center = catLocation4;
            self.catDiabolo.center = catLocation1;
            [[self.catDiabolo superview] bringSubviewToFront:self.catDiabolo];
        }];
        [UIView commitAnimations];
    }
    
    else if (catLocationIndex == 2) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation3;
            self.catPoi.center = catLocation4;
            self.catJuggling.center = catLocation1;
            self.catDiabolo.center = catLocation2;
            [[self.catJuggling superview] bringSubviewToFront:self.catJuggling];
        }];
        [UIView commitAnimations];
    }
    else if (catLocationIndex == 3) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation4;
            self.catPoi.center = catLocation1;
            self.catJuggling.center = catLocation2;
            self.catDiabolo.center = catLocation3;
            [[self.catPoi superview] bringSubviewToFront:self.catPoi];
        }];
        [UIView commitAnimations];
    }
    
    else if (catLocationIndex == 4) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation1;
            self.catPoi.center = catLocation2;
            self.catJuggling.center = catLocation3;
            self.catDiabolo.center = catLocation4;
            [[self.catStaff superview] bringSubviewToFront:self.catStaff];
        }];
        [UIView commitAnimations];
    }
    
    if (catLocationIndex == 4) {
        catLocationIndex = 1;
    }
    else{
        catLocationIndex++;
    }
    NSLog(@"Locaton: %i", catLocationIndex);
    
    
    
}

- (IBAction)swipeRight:(UISwipeGestureRecognizer *)recognizer {
    
    
    if (catLocationIndex == 1) {
        catLocationIndex = 4;
    }
    else{
        catLocationIndex--;
    }
    
    if (catLocationIndex == 4) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation4;
            self.catPoi.center = catLocation1;
            self.catJuggling.center = catLocation2;
            self.catDiabolo.center = catLocation3;
            [[self.catPoi superview] bringSubviewToFront:self.catPoi];
        }];
        [UIView commitAnimations];
    }
    
    
    else if (catLocationIndex == 3) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation3;
            self.catPoi.center = catLocation4;
            self.catJuggling.center = catLocation1;
            self.catDiabolo.center = catLocation2;
            [[self.catJuggling superview] bringSubviewToFront:self.catJuggling];
        }];
        [UIView commitAnimations];
    }
    
    else if (catLocationIndex == 2) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation2;
            self.catPoi.center = catLocation3;
            self.catJuggling.center = catLocation4;
            self.catDiabolo.center = catLocation1;
            [[self.catDiabolo superview] bringSubviewToFront:self.catDiabolo];
        }];
        [UIView commitAnimations];
    }
    
    else if (catLocationIndex == 1) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:1.5 animations:^{
            self.catStaff.center = catLocation1;
            self.catPoi.center = catLocation2;
            self.catJuggling.center = catLocation3;
            self.catDiabolo.center = catLocation4;
            [[self.catStaff superview] bringSubviewToFront:self.catStaff];
        }];
        [UIView commitAnimations];
    }
    
    
    
    NSLog(@"Locaton: %i", catLocationIndex);
    
    
}



- (NSString *)getSelection{
    return self.selection;
}


@end
