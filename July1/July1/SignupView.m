//
//  SignupView.m
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignupView.h"

@implementation SignupView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        btnShowAbout = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnShowAbout.frame = CGRectMake(550, 50, 200, 40);
        
        [btnShowAbout setTitle:@"Back" forState:UIControlStateNormal];
        
        
        [btnShowAbout addTarget:self.superview 
                         action:@selector(ShowAbout:) forControlEvents:UIControlEventTouchUpInside];
        
        btnShowAbout.tag = 3;
        
        [self addSubview:btnShowAbout];
        
        UIFont *font = [UIFont systemFontOfSize: 24];
		CGRect f = CGRectMake(50,100,
                              300,
                              40
                              );
        
        emailtf = [[UITextField alloc] initWithFrame:f];
        
        emailtf.backgroundColor = [UIColor whiteColor];
        emailtf.textColor = [UIColor blackColor];
        emailtf.font = font;
        
        emailtf.text = @"enter email address here";
        
        [self addSubview:emailtf];
        
        
        btnSubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnSubmit.frame = CGRectMake(50, 150, 200, 40);
        
        [btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
        
        
        [btnSubmit addTarget:self 
                      action:@selector(ShowAlert:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:btnSubmit];
        
    }
    return self;
}

-(void) ShowAlert: (id)sender
{
    
    emailstr = emailtf.text;
    
    NSString *str = [NSString stringWithFormat:@"%@\n%@", @"Your email", emailstr];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Thank you for signing up"
        message: str
        delegate: nil	
        cancelButtonTitle: @"Dismiss"
        otherButtonTitles: nil	
                          ];
    
	[alert show];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
