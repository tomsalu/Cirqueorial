//
//  DetailViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 27/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize detailName;
@synthesize detailVideo;
@synthesize videoPlayer;
@synthesize expandVideo;
@synthesize expandText;
@synthesize textViewer;

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
    
    
	//Do any additional setup after loading the view.
    
    NSString *videoURL = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", self.detailVideo.videoURL];
    
    [self.videoPlayer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoURL]]];
    
    NSString *textURL = [NSString stringWithFormat:@"http://www.diabolotricks.com/Grinds.htm#adamgrind"];
    
    [self.textViewer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:textURL]]];
    
    NSLog(@"test");
     
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.detailVideo = (VideoList *) [self detailVideo];
    
    NSLog(@"Name Name Name:%@", self.detailVideo.videoName);
    
    self.detailName.text = self.detailVideo.videoName;

    
}


- (void)viewDidUnload{
    [self setDetailVideo:nil];
    [self setDetailName:nil];
    
}

- (IBAction)expandVideo:(id)sender {
    

    if (videoPlayer.hidden || videoPlayer.frame.size.height == 30) {
        
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x, videoPlayer.frame.origin.y, 320, 0);
        
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
        
        videoPlayer.hidden = NO;
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x-10, videoPlayer.frame.origin.y+37, 320, 320);

        [self.expandVideo setTitle:@"Contract Video" forState:UIControlStateNormal];
            
            
        // Move the 'text tutorial' button
        expandText.frame = CGRectMake(expandText.frame.origin.x, expandText.frame.origin.y+320, 320, 40);
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y+320, textViewer.frame.size.width, textViewer.frame.size.height);
        
        }];
        
        [UIView commitAnimations];
        

        
    }
        
    else if (videoPlayer.frame.size.height == 320){
        
        [UIView beginAnimations:@"Anim2" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
        videoPlayer.frame = CGRectMake(videoPlayer.frame.origin.x+10, videoPlayer.frame.origin.y-37, 300, 30);
        [self.expandVideo setTitle:@"Expand Video" forState:UIControlStateNormal];
            
        // Move the 'text tutorial' button
        expandText.frame = CGRectMake(expandText.frame.origin.x, expandText.frame.origin.y-320, 320, 40);
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y-320, textViewer.frame.size.width, textViewer.frame.size.height);
            
        }];
        [UIView commitAnimations];
        
        
    }

    
}

- (IBAction)expandText:(id)sender {
    if (textViewer.hidden || textViewer.frame.size.height == 30) {
        
        textViewer.frame = CGRectMake(textViewer.frame.origin.x, textViewer.frame.origin.y, 320, 0);
        
        [UIView beginAnimations:@"Anim3" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
            textViewer.hidden = NO;
            textViewer.frame = CGRectMake(textViewer.frame.origin.x-10, textViewer.frame.origin.y+37, 320, 320);
            
            [self.expandText setTitle:@"Contract Text" forState:UIControlStateNormal];
            
            
        }];
        
        [UIView commitAnimations];
        
        
        
    }
    
    else if (textViewer.frame.size.height == 320){
        
        [UIView beginAnimations:@"Anim4" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
            
            textViewer.frame = CGRectMake(textViewer.frame.origin.x+10, textViewer.frame.origin.y-37, 300, 30);
            [self.expandText setTitle:@"Expand Text" forState:UIControlStateNormal];
            
            
        }];
        [UIView commitAnimations];
        
        
    }
    
}
@end
