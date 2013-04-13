//
//  LibSearchViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 13/04/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "LibSearchViewController.h"
#import "LibSearchTableController.h"

@interface LibSearchViewController ()

@end

@implementation LibSearchViewController

@synthesize pickerContent, pickerSelection;

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
    
    pickerContent = [[NSMutableArray alloc] init];
    [pickerContent addObject:@"All"];
    [pickerContent addObject:@"juggling"];
    [pickerContent addObject:@"diabolo"];
    [pickerContent addObject:@"staff"];
    [pickerContent addObject:@"poi"];
    
    if (!pickerSelection) {
        pickerSelection = @"All";
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.keywords) {
        [self.keywords resignFirstResponder];
        
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [[segue destinationViewController] setKeywordSearch:self.keywords.text];
    [[segue destinationViewController] setRatingSearch:self.segment.selectedSegmentIndex+1];
    [[segue destinationViewController] setCatSearch:pickerSelection];
  
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerContent count];
}


- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerContent objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *) pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    [self.label setText:[NSString stringWithFormat:@"Picker is %d %d", row, component]];
    [self.label setText:[NSString stringWithFormat:@"%@", self.pickerContent[row]]];
    pickerSelection = self.pickerContent[row];
}


@end
