//
//  MainView.m
//  Dec15
//
//  Created by Sukman Har on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MainViewController.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame controller:(MainViewController *)mvc
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        mainViewController = mvc;
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImage *eggimage = [UIImage imageNamed:@"egg.png"];
        //UIImage *pastaimage = [UIImage imageNamed:@"pasta.png"];
        
        iv = [[UIImageView alloc] initWithImage:eggimage];
        
        CGRect f = CGRectMake(
                              (self.bounds.size.width - eggimage.size.width)/2, (self.bounds.size.height - eggimage.size.height)/2, eggimage.size.width, eggimage.size.height);
        
        iv.frame = f;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        
        label.text = @"Egg Cooking Timer";
        iv.hidden = YES;
        
        [self addSubview:iv];
        [self addSubview:label];
        
        // button //
        UIButton *onemin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *threemin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *fivemin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [onemin setTitle:@"1 Min" forState:UIControlStateNormal];
        [threemin setTitle:@"3 Min" forState:UIControlStateNormal];
        [fivemin setTitle:@"5 Min" forState:UIControlStateNormal];
        
        onemin.frame = CGRectMake(100, self.bounds.size.height * 4/5, 100, 40);
        threemin.frame = CGRectMake(300, self.bounds.size.height * 4/5, 100, 40);
        fivemin.frame = CGRectMake(500, self.bounds.size.height * 4/5, 100, 40);
        
        [onemin addTarget: mvc
                   action: @selector(setTimer:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        onemin.tag = 0;
        
        [threemin addTarget: mvc
                     action:@selector(setTimer:) forControlEvents:UIControlEventTouchUpInside];
        threemin.tag = 1;
        
        [fivemin addTarget:mvc action:@selector(setTimer:) forControlEvents:UIControlEventTouchUpInside];
        fivemin.tag = 2;
        
        
        [self addSubview:onemin];
        [self addSubview:threemin];
        [self addSubview:fivemin];
        
        //Put origin of View at center of View.
		        
		indicator = [[UIActivityIndicatorView alloc] initWithFrame: CGRectZero];
		indicator.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
		//StyleWhite would be invisible on a white background.
		indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		indicator.hidesWhenStopped = NO;	//default is YES
        indicator.hidden = YES;
		[self addSubview: indicator];
        
        // Initialization code
    }
    return self;
}

- (void) display
{
	iv.hidden = NO;
    indicator.hidden = YES;
}

- (void) undisplay
{
    iv.hidden = YES;
    indicator.hidden = NO;
    
}

- (void) startAnimating
{
	[indicator startAnimating];
}


- (void) stopAnimating
{
	[indicator stopAnimating];
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
