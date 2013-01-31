//
//  LibraryViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "LibraryViewController.h"
#import "ViewController.h"
#import "DetailViewController.h"
#import "Database.h"
#import "VideoList.h"

@interface LibraryViewController ()

@end

@implementation LibraryViewController

@synthesize ops;
@synthesize tableVideos;
@synthesize filteredtableVidoes;
@synthesize searchWasActive, savedScopeButtonIndex, savedSearchTerm;

NSString *sel = @"";

//ViewController *vc;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //[super viewDidLoad];
    
    self.videoTable.dataSource = self;
    self.videoTable.delegate = self;
    
    // create a filtered list that will contain products for the search results table.
	self.filteredtableVidoes = [NSMutableArray arrayWithCapacity:[self.tableVideos count]];
	
	// restore search settings if they were saved in didReceiveMemoryWarning.
    if (self.savedSearchTerm)
	{
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
        [self.searchDisplayController.searchBar setText:savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }
	
	[self.tableView reloadData];
    self.tableView.scrollEnabled = YES;

    NSLog(@"Normal Array Count: %i", tableVideos.count);
    NSLog(@"Filtered Array Count: %i", filteredtableVidoes.count);
    
}

- (void)viewDidUnload{
    
    [self setVideoTable:nil];
    self.filteredtableVidoes = nil;

    //[super viewDidUnload];
    
}


- (void)viewDidDisappear:(BOOL)animated
{
    // save the state of the search UI so that it can be restored if the view is re-created
    self.searchWasActive = [self.searchDisplayController isActive];
    self.savedSearchTerm = [self.searchDisplayController.searchBar text];
    self.savedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
}

- (void)viewWillAppear:(BOOL)animated{
    
    if (sel != nil) {

    ops = [[Database alloc]init];

    //[self.ops getVideo];
    
    
    if ([sel isEqualToString:@"juggling"]) {
        [self.ops getJugglingVideo:@"juggling"];
    }
    else if ([sel isEqualToString:@"poi"]) {
        [self.ops getJugglingVideo:@"poi"];
    }
    else if ([sel isEqualToString:@"staff"]) {
        [self.ops getJugglingVideo:@"staff"];
    }
    else if ([sel isEqualToString:@"diabolo"]) {
        [self.ops getJugglingVideo:@"diabolo"];
    }
    else{
        NSLog(@"Went Wrong");
    }
    
    tableVideos = [ops videoArray];
    [self.videoTable reloadData];
    sel = nil;
    }
    
    [super viewWillAppear:animated];
    
}

- (void) createTable:(NSString *) catSelection{
    sel = catSelection;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [filteredtableVidoes count];
    }
    else{
    return [tableVideos count];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"listCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    VideoList * userObj = [ops.videoArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", userObj.videoName];
    NSLog(@"Cell Text Label: %@", userObj.videoName);

    /*
	 If there's been a search, use the filtered list. If not, use the regular.
	 */
	VideoList *videoL = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        videoL = [self.filteredtableVidoes objectAtIndex:indexPath.row];
    }
	else
	{
        videoL = [self.tableVideos objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.detailVideo = [self.tableVideos objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}


#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredtableVidoes removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (VideoList *videoL in tableVideos)
	{
		if ([scope isEqualToString:@"All"] || [videoL.videoName isEqualToString:scope])
		{
			NSComparisonResult result = [videoL.videoName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.filteredtableVidoes addObject:videoL];
            }
		}
	}
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailsViewController = [[UIViewController alloc] init];
    
	/*
	 If the requesting table view is the search display controller's table view, configure the next view controller using the filtered content, otherwise use the main list.
	 */
	VideoList *videoL = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        videoL = [self.filteredtableVidoes objectAtIndex:indexPath.row];
    }
	else
	{
        videoL = [self.tableVideos objectAtIndex:indexPath.row];
    }
	detailsViewController.title = videoL.videoName;
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

@end
