//
//  ParseUserViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 21/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ParseUserViewController.h"
#import "UserDetailViewController.h"

@interface ParseUserViewController ()

@end

@implementation ParseUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showUserDetail"]) {
        // Row selection
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSLog(@"Count: %i", self.objects.count);
        PFUser *user = [self.objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setUserObject:user];
    }
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
    NSLog(@"Count: %i", self.objects.count);

    
    // This method is called before a PFQuery is fired to get more objects
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method is called every time objects are loaded from Parse via the PFQuery
}

- (PFQuery *)queryForTable{
    
    /*
    PFQuery *userQ = [PFUser query];
    [userQ whereKey:@"following" equalTo:self.detailItem.objectId];
    
    
    return  userQ;
     */
    //////////
    
    PFUser *user = [PFUser currentUser];
    NSMutableArray *followArray = [user objectForKey:@"following"];
    
    PFQuery *followQuery = [PFUser query];

    [followQuery whereKey:@"objectId" containedIn:followArray];
    
    return followQuery;

    
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UserCell"];
    
    
    // Configure the cell
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [object objectForKey:@"First_Name"], [object objectForKey:@"Surname"]];
    
    //cell.imageView.file = [object objectForKey:self.imageKey];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
