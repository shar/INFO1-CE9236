//
//  ModalViewController.m
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"
#import "Restaurant.h"
#import "ModalView.h"
@implementation ModalViewController


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}



-(id)initWithData: (Restaurant *) r
{
    self = [super initWithNibName:nil bundle:nil];
    
    if ( self ) 
    {
        rdata = r;
        
        self.title = r.Name;
		
		self.navigationItem.rightBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Done"
                                         style: UIBarButtonItemStylePlain
                                        target: self
                                        action: @selector(done)
         ];

    }
    
    return self;
    
}


- (void) dismissModalViewController {
	//Before iOS 5, we said parentViewController instead of presentingViewController.
	[self.presentingViewController dismissModalViewControllerAnimated: YES];
}

- (void) done 
{
	//[modalViewController dismissModalViewController];
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    
	self.view = [[ModalView alloc] initWithFrame: frame controller: self data:rdata];
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
