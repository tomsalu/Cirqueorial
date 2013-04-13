//
//  LibSearchViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 13/04/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibSearchViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;

@property (strong, nonatomic) IBOutlet UITextField *keywords;

@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@property (strong, nonatomic) NSMutableArray *pickerContent;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) NSString *pickerSelection;


@end
