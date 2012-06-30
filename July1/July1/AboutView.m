//
//  AboutView.m
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        btnShowTitle = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnShowTitle.frame = CGRectMake(550, 900, 200, 40);
        
        [btnShowTitle setTitle:@"Back" forState:UIControlStateNormal];
        
        
        [btnShowTitle addTarget:self.superview 
         action:@selector(ShowTitle:) forControlEvents:UIControlEventTouchUpInside];
        
        btnShowTitle.tag = 2;
        
        [self addSubview:btnShowTitle];
        
        btnShowSignup = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnShowSignup.frame = CGRectMake(50, 900, 200, 40);
        
        [btnShowSignup setTitle:@"Sign Up" forState:UIControlStateNormal];
        
        
        [btnShowSignup addTarget:self.superview 
                         action:@selector(ShowSignup:) forControlEvents:UIControlEventTouchUpInside];
        
        btnShowSignup.tag = 2;
        
        [self addSubview:btnShowSignup];

        
        UIFont *font = [UIFont systemFontOfSize: 24];
		CGRect b = self.bounds;
		CGRect f = CGRectMake(50,20,
                              b.size.width -100,
                              300
                              );
                
        UITextView *tv = [[UITextView alloc] initWithFrame:f];
        
        tv.backgroundColor = [UIColor whiteColor];
        tv.textColor = [UIColor blackColor];
        tv.font = font;
		tv.editable = NO;
        
        tv.text = @"How to read chord charts\n\nThe horizontal lines represent the frets on the guitar and the vertical lines represent the strings. The numbers listed let you know what fret number it is referring too. If there is an X it means don't play that string and if there is a 0 it means to play that string but do not press down on it anywhere. The black circles show you where to press down.";
        
        [self addSubview:tv];

    }
    return self;
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
