//
//  MainViewController.m
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "ModalViewController.h"
#import "Restaurant.h"

@implementation MainViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

-(id) initWithTitle:(NSString *)d data: (NSArray *) data image: (UIImage *) image
{
    self = [super initWithNibName:nil bundle:nil];
    
    if ( self != nil)
    {
        self.title = d;
        Data = data;
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void) presentModalViewController: (Restaurant *) r {
    
    //NSLog(@"data: %@", r.Type);
    
    ModalViewController *mvc = [[ModalViewController alloc] initWithData:r];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mvc];
    
    [self presentModalViewController:navigationController animated:YES];
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
    self.view = [[MainView alloc] initWithFrame:frame controller:self data:Data];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
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
