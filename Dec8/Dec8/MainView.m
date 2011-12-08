//
//  MainView.m
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

// listing top 5 restaurants in the region with a button

#import "MainView.h"
#import "MainViewController.h"
#import "Restaurant.h"

@implementation MainView

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/

- (id) initWithFrame:(CGRect)frame controller:(MainViewController *)mvc data:(NSArray *) data
{
    self = [super initWithFrame:frame];
    
    if ( self ) 
    {
        self.backgroundColor = [UIColor whiteColor];
        mainViewController = mvc;
        rdata = data;
        
        int i = 0;
        
        for (Restaurant *r in data) 
        {
            label = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x +20, frame.origin.y + (i * 30), 200, 20)];
            button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(frame.origin.x + 220, frame.origin.y + (i*30), 100, 25);
            [button setTitle:@"Info" forState:UIControlStateNormal];
            
            
            [button addTarget:self action:@selector(loadModal:)  forControlEvents: UIControlEventTouchUpInside];
            button.tag = i;
            
            label.text = r.Name;
            [self addSubview:label];
            [self addSubview:button];
            i++;
		}
    }
    
    return self;
}

-(void) loadModal: (id) sender 
{
    NSInteger *tid = ((UIControl*)sender).tag;
    
    Restaurant *r = [rdata objectAtIndex:tid];
    
    
    [mainViewController presentModalViewController:r];
    
}

/*
 [self performSelector:@selector(fooNoInputs)];
 [self performSelector:@selector(fooOneInput:) withObject:@"first"];
 [self performSelector:@selector(fooFirstInput:secondInput:) withObject:@"first" withObject:@"second"];
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //NSString *s = mainViewController.title;
    
    //[s drawAtPoint:CGPointZero withFont:[UIFont systemFontOfSize:32]];
}


@end
