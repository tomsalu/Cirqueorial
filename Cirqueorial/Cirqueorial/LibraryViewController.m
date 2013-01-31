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
    [super viewDidLoad];
    
    self.videoTable.dataSource = self;
    self.videoTable.delegate = self;
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    /*
    ops = [[Database alloc] init];
    [ops getVideo];
    tableVideos = [self.ops videoArray];
     */
}

- (void)viewDidUnload{
    
    [self setVideoTable:nil];
    [super viewDidUnload];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    if (sel != nil) {

    ops = [[Database alloc]init];

    CategoryViewController *catVC;
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
    return [tableVideos count];
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

    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.detailVideo = [self.tableVideos objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
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

#pragma mark - Table view delegate

- (void)tableVideos:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
