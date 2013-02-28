//
//  ParseLibraryViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 28/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ParseLibraryViewController.h"
#import "DetailViewController.h"

@interface ParseLibraryViewController ()

@end

@implementation ParseLibraryViewController

@synthesize categoryChosen;

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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showLibraryDetail"]) {
        //Row Selection
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *lib = [self.objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setLibObject:lib];
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
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
}

- (PFQuery *)queryForTable{
    
    PFQuery *catQuery = [PFQuery queryWithClassName:@"Video"];
    [catQuery whereKey:@"Video_Category" equalTo:categoryChosen];
    
    return  catQuery;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LibCell"];
    
    
    // Configure the cell
    
    cell.textLabel.text = [object objectForKey:@"Video_Name"];
    
    //cell.imageView.file = [object objectForKey:self.imageKey];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}


@end
