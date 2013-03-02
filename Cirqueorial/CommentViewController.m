//
//  CommentViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 28/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

@synthesize commentField;
@synthesize ID;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
    [super objectsWillLoad];
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
}

- (PFQuery *)queryForTable{
    
    NSLog(@"ID is: %@", ID);
    PFQuery *trickQuery = [PFQuery queryWithClassName:@"Comment"];
    [trickQuery whereKey:@"Comment_TrickID" equalTo:self.ID];
    
    
    return  trickQuery;
     
}
 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    
    
    // Configure the cell
    
        //Main Comment
    cell.textLabel.text = [object objectForKey:@"Comment_Text"];
    
        //Date of comment
    
    cell.detailTextLabel.text = @"%@ by",[NSDateFormatter localizedStringFromDate:[object createdAt] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
    
    //cell.imageView.file = [object objectForKey:self.imageKey];
    
    return cell;
}





#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == commentField) {
        [commentField resignFirstResponder];
        
    }
    return YES;
}

- (IBAction)submitButton:(id)sender {
    PFObject *comment = [PFObject objectWithClassName:@"Comment"];
    [comment setObject:commentField.text forKey:@"Comment_Text"];
    [comment setObject:self.ID forKey:@"Comment_TrickID"];
    [comment saveInBackground];
    
    
}
@end
