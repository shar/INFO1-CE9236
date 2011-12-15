//
//  MainViewController.m
//  Dec15
//
//  Created by Sukman Har on 12/13/11.
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
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    self.view = [[MainView alloc] initWithFrame:frame controller:self];
}
 

- (void) setTimer: (id) sender 
{
    [(MainView *)self.view undisplay];
    int tid = ((UIControl*)sender).tag;
    NSLog(@"%u", tid);
    
    int timelapsed;
    
    switch (tid) 
    {
		case 0:
			timelapsed = 60;
			break;
		case 1:
			timelapsed = 180;
			break;
		case 2:
			timelapsed = 300;
			break;
		default:
			NSLog(@"Unknown");
			break;
	}
    
    [NSTimer scheduledTimerWithTimeInterval: timelapsed
                                     target: self
                                   selector: @selector(display:)
                                   userInfo: nil
                                    repeats: NO
     ];
    
    [(MainView *)self.view startAnimating];
    
	[NSTimer scheduledTimerWithTimeInterval: timelapsed
                                     target: self
                                   selector: @selector(stop:)
                                   userInfo: nil
                                    repeats: NO
     ];

    
}




- (void) stop: (NSTimer *) timer {
	[timer invalidate];	//Don't need this timer any more.
	[(MainView *)self.view stopAnimating];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void) display: (NSTimer *) timer {
	[timer invalidate];	//Don't need this timer any more.
	[(MainView *)self.view display];
    
    // set sound 
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = [bundle pathForResource:@"Beep" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filename isDirectory:NO];
    
    OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
    AudioServicesPlaySystemSound(sid);
    
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
