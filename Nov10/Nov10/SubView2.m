//
//  SubView2.m
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SubView2.h"

@implementation SubView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        path = CGPathCreateMutable();	//born empty
        
        red = 0;
        green = 0;
        blue = 0;
        alpha = 1;

        UITapGestureRecognizer *tripletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(threetap:)];
        tripletap.numberOfTapsRequired = 3;
        [self addGestureRecognizer:tripletap];

        UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twotap:)];
        doubletap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubletap];
        [doubletap requireGestureRecognizerToFail:tripletap];
        
        
        UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onetap:)];
        singletap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singletap];
        [singletap requireGestureRecognizerToFail:tripletap];
        [singletap requireGestureRecognizerToFail:doubletap];
    }
    return self;
}

-(void)threetap:(UITapGestureRecognizer *) recognizer{
    NSLog(@"3 Tap");
    red = 1;
    green = 0;
    blue = 0;
    
	
}

-(void)twotap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"2 Tap");
    red = 0;
    green = 1;
    blue = 0;
    
	
}

-(void)onetap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"1 Tap");
    red = 0;
    green = 0;
    blue = 1;
    
	
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathMoveToPoint(path, NULL, p.x, p.y);
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathAddLineToPoint(path, NULL, p.x, p.y);
	[self setNeedsDisplay];	//Trigger a call to drawRect:.
    
    }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSString *string = @"Drawing Pad; tap to change color\nApp support up to 3 taps.";
	UIFont *font = [UIFont systemFontOfSize: 20];
	[string drawAtPoint: CGPointZero withFont: font];
    
    // Drawing code
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c);
	CGContextAddPath(c, path);
	CGContextSetRGBStrokeColor(c, red, green, blue, alpha);	
	CGContextStrokePath(c);
    CGContextClosePath(c);

	
}


@end
