//
//  UserViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 03/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "UserViewController.h"
#import "ViewController.h"
#import "DetailViewController.h"
#import "Database.h"
#import "UserList.h"

@interface UserViewController ()

@end

@implementation UserViewController

@synthesize ops;
@synthesize tableUsers;

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
    
    self.userTable.dataSource = self;
    self.userTable.delegate = self;
    
    
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
    
    [self setUserTable:nil];
    [super viewDidUnload];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
        
        ops = [[Database alloc]init];
        
        [self.ops getUsers];
        
        
        tableUsers = [ops userArray];
        [self.userTable reloadData];
    
    
    [super viewWillAppear:animated];
    
}

- (void) reIndexTable{
    //ops = [[Database alloc]init];
    
    [self.ops getUsers];
    
    
    tableUsers = [ops userArray];
    [self.userTable reloadData];

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
    return [tableUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"listCell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UserList * userObj = [ops.userArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", userObj.firstName];
    NSLog(@"Cell Text Label: %@", userObj.firstName);
    
    
    return cell;
}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.detailVideo = [self.tableUsers objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}
 */



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

- (void)tableUsers:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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