//
//  MainViewController.m
//  Dec1
//
//  Created by Sukman Har on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import <AudioToolbox/AudioToolbox.h>	
@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) 
    {
        // Custom initialization
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    // associate view to its view controller
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    // pass the controller to the view so the view can use some method in the controller
    self.view = [[MainView alloc] initWithFrame:frame controller: self];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    displayLink = [CADisplayLink displayLinkWithTarget:self.view selector:@selector(play:)]; 
    
    // call method everytime the display is refreshed
    displayLink.frameInterval = 1;
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [displayLink addToRunLoop:loop forMode:NSDefaultRunLoopMode];
    
    // play background music
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *backgroundmusicfile = [bundle pathForResource:@"Electric" ofType:@"mp3"];
    
    NSURL *bgurl = [NSURL fileURLWithPath:backgroundmusicfile isDirectory:NO];
    
    NSError *error = nil;
    backgroundplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bgurl error:&error];
    backgroundplayer.volume = 0.2;
    backgroundplayer.numberOfLoops = -1;
    [backgroundplayer prepareToPlay];
    [backgroundplayer play];
}

// to be used by the view to play crunch sound
-(void)playcrunchsound
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *chewsoundfile = [bundle pathForResource:@"crunching" ofType:@"mp3"];
    NSURL *crunchurl = [NSURL fileURLWithPath:chewsoundfile isDirectory:NO];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)crunchurl, &sid);
    AudioServicesPlaySystemSound(sid);
}

-(void) playbouncesound
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bouncesoundfile = [bundle pathForResource:@"ball" ofType:@"mp3"];
    NSURL *bounceurl = [NSURL fileURLWithPath:bouncesoundfile isDirectory:NO];
    NSError *berror = nil;
    bounceplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bounceurl error:&berror];
    bounceplayer.volume = 0.8;
    bounceplayer.numberOfLoops = 0;
    [bounceplayer prepareToPlay];
    [bounceplayer play];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
