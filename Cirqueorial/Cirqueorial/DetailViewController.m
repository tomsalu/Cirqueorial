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
@synthesize detailURL;
@synthesize detailVideo;
@synthesize videoPlayer;

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
	// Do any additional setup after loading the view.
    /*
    NSString *videoURL = [NSString stringWithFormat:@"<iframe width=\"300\" height=\"200\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\" allowfullscreen></iframe>", self.detailVideo.videoURL];
    */
    
    NSString *videoURL = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", self.detailVideo.videoURL];
    
    [self.videoPlayer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoURL]]];
    
    NSLog(@"test");
    
    
    //[self.videoPlayer loadHTMLString:videoURL baseURL:nil];
    
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
    self.detailURL.text = self.detailVideo.videoURL;

    
}

- (void)viewDidUnload{
    [self setDetailVideo:nil];
    [self setDetailName:nil];
    [self setDetailURL:nil];
    
}

@end
