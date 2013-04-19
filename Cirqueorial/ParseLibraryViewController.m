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
    
    if ([self.categoryChosen isEqualToString:@"juggling"]) {
        self.navigationItem.title = @"Juggling";
    }
    else if ([self.categoryChosen isEqualToString:@"poi"]) {
        self.navigationItem.title = @"Poi";
    }
    else if ([self.categoryChosen isEqualToString:@"staff"]) {
        self.navigationItem.title = @"Staff";
    }
    else if ([self.categoryChosen isEqualToString:@"diabolo"]) {
        self.navigationItem.title = @"Diabolo";
    }
    

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
    
    if (!categoryChosen) {
        NSLog(@"CAT is null");
    }
    else if (categoryChosen){
        NSLog(@"Cat is not null");
        
    }
    else{
        NSLog(@"Unexpected result");
    }
    
    PFQuery *catQuery = [PFQuery queryWithClassName:@"Video"];
    [catQuery whereKey:@"Video_Category" equalTo:categoryChosen];
    
    return  catQuery;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LibCell"];
    
    
    // Configure the cell
    
    cell.textLabel.text = [object objectForKey:@"Video_Name"];
    
    
    ///////DISPLAY TRICK RATING!//////////    //////////////    //////////////    //////////////
    
    
    
    NSMutableArray *ratingArray = [object objectForKey:@"Rating"];
    int total = 0;

    NSLog(@"%@ :-\n", [object objectForKey:@"Video_Name"]);
    for (int i = 0; i < ratingArray.count; i++) {

        int arrayInt = [ratingArray[i] intValue];
        total = total + arrayInt;
        
        
    }


    float newRating = (float)total / (float)ratingArray.count;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Rating: %.1f of 5 (Based on %i ratings)", newRating, ratingArray.count];
    
    
    
    
    
    //////////////    //////////////    //////////////    //////////////    //////////////
    
    //cell.imageView.file = [object objectForKey:self.imageKey];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}


@end
