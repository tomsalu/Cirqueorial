//
//  DetailViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "DetailViewController.h"
#import "CommentViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize detailVideo;
@synthesize videoPlayer;
@synthesize expandVideo;
@synthesize expandText;
@synthesize textViewer;
@synthesize libObject = _libObject;
@synthesize star1,star2,star3,star4,star5,submitRatingButton;

int currentRating = 0;
bool isAble;
PFUser *currentUser;
PFQuery *canDoQ;



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
    
    NSString *name = [self.libObject objectForKey:@"Video_Name"];
    
    self.navigationItem.title = name;
    
    //Change XP Label
    self.xpLabel.text = [NSString stringWithFormat:@"XP: %@", [self.libObject objectForKey:@"xpValue"]];

    
    
	//Do any additional setup after loading the view.
    
    NSString *videoURL = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", [self.libObject objectForKey:@"Video_URL"]];

    [self.videoPlayer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoURL]]];
    

    
    NSString *textURL = [self.libObject objectForKey:@"Text_URL"];
    
    [self.textViewer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:textURL]]];

    

    
    NSLog(@"test");
    
    /////////////Can the user do this trick? ////////////////
    
    //Find out the current user //
    currentUser = [PFUser currentUser];
    
    //Find out if already can do this trick//
    canDoQ = [PFUser query];
    [canDoQ whereKey:@"objectId" equalTo:currentUser.objectId];
    [canDoQ whereKey:@"canDo" equalTo:self.libObject.objectId];
    NSArray *canDoArray = [canDoQ findObjects];
    isAble = NO;
    
    for (int i = 0; i < canDoArray.count; i++) {
        isAble = YES;
    }
    
    if (isAble) {
        self.canDoLabel.tintColor = [UIColor colorWithHue:0.4 saturation:1.0 brightness:0.6 alpha:1.0];
    }
    else{
        self.canDoLabel.tintColor = nil;
        
    }
    
    // Change Logo
    
    NSString *cat = [self.libObject objectForKey:@"Video_Category"];
    
    if ([cat isEqualToString:@"juggling"]) {
        self.logo.image = [UIImage imageNamed:@"tom_juggling.png"];
    }
    else if ([cat isEqualToString:@"diabolo"]) {
        self.logo.image = [UIImage imageNamed:@"tom_diabolo.png"];
    }
    else if ([cat isEqualToString:@"poi"]) {
        self.logo.image = [UIImage imageNamed:@"tom_poi.png"];
    }
    else if ([cat isEqualToString:@"staff"]) {
        self.logo.image = [UIImage imageNamed:@"tom_staff.png"];
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    //self.detailVideo = (VideoList *) [self detailVideo];
    
    
    //self.detailName.text = self.detailVideo.videoName;

    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showComments"]) {

        NSLog(@"Object ID: %@", [self.libObject objectId]);
        [[segue destinationViewController] setID:[self.libObject objectId]];
    }
    
    
    
}


- (void)viewDidUnload{
//    [self setDetailVideo:nil];
//    [self setDetailName:nil];
    
}

- (IBAction)expandVideo:(id)sender {
    

    if (videoPlayer.hidden || videoPlayer.frame.size.height == 30) {
        
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x, videoPlayer.frame.origin.y, videoPlayer.frame.size.width, 0);
        
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
        
        videoPlayer.hidden = NO;
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x-0, videoPlayer.frame.origin.y+37, videoPlayer.frame.size.width, 320);

        [self.expandVideo setTitle:@"Contract Video" forState:UIControlStateNormal];
            
            
        // Move the 'text tutorial' button
        expandText.frame = CGRectMake(expandText.frame.origin.x, expandText.frame.origin.y+320, expandVideo.frame.size.width, 40);
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y+320, textViewer.frame.size.width, textViewer.frame.size.height);
        
        }];
        
        [UIView commitAnimations];
        

        
    }
        
    else if (videoPlayer.frame.size.height == 320){
        
        [UIView beginAnimations:@"Anim2" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x+0, videoPlayer.frame.origin.y-37, videoPlayer.frame.size.width, 30);
        [self.expandVideo setTitle:@"Expand Video" forState:UIControlStateNormal];
            
        // Move the 'text tutorial' button
        expandText.frame = CGRectMake(expandText.frame.origin.x, expandText.frame.origin.y-320, expandVideo.frame.size.width, 40);
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y-320, textViewer.frame.size.width, textViewer.frame.size.height);
            
        }];
        [UIView commitAnimations];
        
//        [[self.catStaff superview] bringSubviewToFront:self.catStaff];
        [[expandVideo superview] bringSubviewToFront:expandVideo];

        
    }
    
    

    
}

- (IBAction)expandText:(id)sender {
    if (textViewer.hidden || textViewer.frame.size.height == 30) {
        
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y, textViewer.frame.size.width, 0);
        
        [UIView beginAnimations:@"Anim3" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
        textViewer.hidden = NO;
        textViewer.frame = CGRectMake(textViewer.frame.origin.x-0, textViewer.frame.origin.y+37, textViewer.frame.size.width, 320);
            
        [self.expandText setTitle:@"Contract Text" forState:UIControlStateNormal];
            
            
        }];
        
        [UIView commitAnimations];
        
        
        
    }
    
    else if (textViewer.frame.size.height == 320){
        
        [UIView beginAnimations:@"Anim4" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
        textViewer.frame = CGRectMake(textViewer.frame.origin.x+0, textViewer.frame.origin.y-37, textViewer.frame.size.width, 30);
        [self.expandText setTitle:@"Expand Text" forState:UIControlStateNormal];
            
            
        }];
        [UIView commitAnimations];
        [[expandText superview] bringSubviewToFront:expandText];
        
        
    }
    
}


- (IBAction) changeButtonImage:(id) sender{
    
    [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_off.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"starRating_off.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"starRating_off.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"starRating_off.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"starRating_off.png"] forState:UIControlStateNormal];
    
    if (star1.highlighted) {
       [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        currentRating = 1;
    }
    else if (star2.highlighted) {
        [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        currentRating = 2;
    }
    else if (star3.highlighted) {
        [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        currentRating = 3;
    }
    else if (star4.highlighted) {
        [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        currentRating = 4;
    }
    else if (star5.highlighted) {
        [star1 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"starRating_on.png"] forState:UIControlStateNormal];
        currentRating = 5;
    }
}

- (IBAction)submitRating:(id)sender {
    
    //ADD RATING TO RATING FIELD IN DATABASE (Rating)
    [self.libObject addObject:[NSNumber numberWithInt:currentRating] forKey:@"Rating"];
    [self.libObject saveInBackground];
    
    //SEND AVERAGE RATING TO DATABASE (Rating_Average)
    
    NSMutableArray *ratingArray = [self.libObject objectForKey:@"Rating"];
    int total = 0;
    
    for (int i = 0; i < ratingArray.count; i++) {
        
        int arrayInt = [ratingArray[i] intValue];
        total = total + arrayInt;
        
    }
    

    float newRating = (float)total / (float)ratingArray.count;
    [self.libObject setObject:[NSString stringWithFormat:@"%.1f",newRating] forKey:@"Rating_Average"];
    [self.libObject saveInBackground];
    
    
    
    
    NSString *message = [NSString stringWithFormat:@"You have successfully rated this trick %i stars", currentRating];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful Rating" message:message delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil , nil];
    [alert show];
    
    
}

- (IBAction)canDo:(id)sender {
    
    
    if (isAble) {
        
        NSMutableArray *canDoArray = [currentUser objectForKey:@"canDo"];
        
        for (int i = 0; i < canDoArray.count; i++) {
            if ([canDoArray[i] isEqualToString:self.libObject.objectId]) {
                [canDoArray removeObjectAtIndex:i];
            }
        }
        
        
        [currentUser setObject:canDoArray forKey:@"canDo"];
        
        //[currentUser incrementKey:@"xp" byAmount:[self.libObject objectForKey:@"xpValue"]];

        int dec = [[self.libObject objectForKey:@"xpValue"] intValue];
        int newDec = 0 - dec;
        [currentUser incrementKey:@"xp" byAmount:[NSNumber numberWithInt:newDec]];
        
        [currentUser saveInBackground];
        
        self.canDoLabel.tintColor = nil;
        isAble = false;
        
        
        
        
    }
    else if (!isAble){
        //Add the open trick's ID to the current users 'canDo' array
        [currentUser addObject:self.libObject.objectId forKey:@"canDo"];
        [currentUser incrementKey:@"xp" byAmount:[self.libObject objectForKey:@"xpValue"]];
        //Save
        [currentUser saveInBackground];
        isAble = YES;
        
        self.canDoLabel.tintColor = [UIColor colorWithHue:0.4 saturation:1.0 brightness:0.6 alpha:1.0];
        
    }
    else{
        NSLog(@"Broke");
    }
    
    
}

- (IBAction)shareButton:(id)sender {
    
    BOOL dispalyedNativeDialog =
    [FBNativeDialogs presentShareDialogModallyFrom:self
     //set status text
                                       initialText:[NSString stringWithFormat:@"I'm currently learning \"%@\" on Cirqueorial!", [self.libObject objectForKey:@"Video_Name"]]
                                             image:[UIImage imageNamed:@"testimage.png"]
                                               url:nil/*[NSURL URLWithString:@"http:www.nyt.com"]*/
                                           handler:^(FBNativeDialogResult result, NSError *error) {
                                               if (error) {
                                                   // Handle Failure
                                               }
                                               else{
                                                   if (result == FBNativeDialogResultSucceeded) {
                                                       // Handle Success
                                                   }
                                                   else{
                                                       //Handle User Cancel
                                                   }
                                               }
                                           }];
    if (!dispalyedNativeDialog) {
        //
    }
        
}
    
@end
