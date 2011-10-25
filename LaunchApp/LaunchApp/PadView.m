//
//  PadView.m
//  LaunchApp
//
//  Created by Sukman Har on 10/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PadView.h"

@implementation PadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // internationalization
        
    CGContextRef c =UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(c);
    
    //get dimension first
    
    CGRect b = self.bounds;
    CGRect f = self.frame;
	
    NSLog(@"self.frame == (%g, %g), %g × %g",
          f.origin.x,
          f.origin.y,
          f.size.width,
          f.size.height
          );
    
	NSLog(@"self.bounds == (%g, %g), %g × %g",
          b.origin.x,
          b.origin.y,
          b.size.width,
          b.size.height
          );
    
    CGRect board = CGRectMake(f.origin.x, f.origin.y, f.size.width, f.size.height * 4 /5 );
    CGContextAddRect(c, board);
    CGContextClosePath(c);

    CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    //CGContextStrokePath(c);
    CGContextFillPath(c);

    // welcome text
    //CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);
    //NSString *s = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint");
    
    //[s drawAtPoint:CGPointMake(50,50) withFont:[UIFont systemFontOfSize: 50]];

    /*
    // add graph line //
    // 1. vertical lines //
    int xlinenum = 38;
    int ylinenum = 39;
    int separator = 20;
    
    for (int i = 0; i <= xlinenum; ++i) 
    {
        CGContextBeginPath(c);
        CGContextMoveToPoint(c, i * separator , 0);
        CGContextAddLineToPoint(c, i* separator, graph.size.height);
        CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 0.5);
        CGContextStrokePath(c);
    }
    
    // 2. horizontal lines //
    for (int j = 0; j<=ylinenum; ++j)
    {
     CGContextBeginPath(c);
     CGContextMoveToPoint(c, 0 ,j * separator);
     CGContextAddLineToPoint(c, graph.size.width,j*separator);
     CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 0.5);
     CGContextStrokePath(c);
    }
    */
    
    CGRect palette = CGRectMake(f.origin.x , f.origin.y + board.size.height + 20, f.size.width, f.size.height * 1 /5 -20 );
    CGContextAddRect(c, palette);
    CGContextClosePath(c);
    
    CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    
    //CGContextStrokePath(c);
    CGContextFillPath(c);

    
    // star with different color //
    // using HTML color and internationalization //
    CGFloat radius = 15;	//of circle that the 5 vertices touch
	
    CGPoint redstar = CGPointMake( f.origin.x + 30, board.size.height + 60);
    
	CGContextBeginPath(c);
	
	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
                         redstar.x + radius * cosf(theta),
                         redstar.y - radius * sinf(theta)
                         );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
                            redstar.x + radius * cosf(theta),
                            redstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
                            redstar.x + radius * cosf(theta),
                            redstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
                            redstar.x + radius * cosf(theta),
                            redstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
                            redstar.x + radius * cosf(theta),
                            redstar.y - radius * sinf(theta)
                            );
    
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    
    // red text 
    CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
    NSString *red = NSLocalizedString(@"Red", @"displayed with drawAtPoint");
    [red drawAtPoint:CGPointMake(f.origin.x + 60, board.size.height + 40) withFont:[UIFont systemFontOfSize: 32]];
     

    // green //
    CGPoint greenstar = CGPointMake( f.origin.x + 30, board.size.height + 100);
    
	CGContextBeginPath(c);
	
	theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
                         greenstar.x + radius * cosf(theta),
                         greenstar.y - radius * sinf(theta)
                         );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
                            greenstar.x + radius * cosf(theta),
                            greenstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
                            greenstar.x + radius * cosf(theta),
                            greenstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
                            greenstar.x + radius * cosf(theta),
                            greenstar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
                            greenstar.x + radius * cosf(theta),
                            greenstar.y - radius * sinf(theta)
                            );
    
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 0.0, 1.0, 0.0, 1.0);
	CGContextFillPath(c);

    // green text 
    CGContextSetRGBFillColor(c, 0.0, 1.0, 0.0, 1.0);
    NSString *green = NSLocalizedString(@"Green", @"displayed with drawAtPoint");
    [green drawAtPoint:CGPointMake(f.origin.x + 60, board.size.height + 80) withFont:[UIFont systemFontOfSize: 32]];

    // blue
    CGPoint bluestar = CGPointMake( f.origin.x + 30, board.size.height + 140);
    
	CGContextBeginPath(c);
	
	theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
                         bluestar.x + radius * cosf(theta),
                         bluestar.y - radius * sinf(theta)
                         );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
                            bluestar.x + radius * cosf(theta),
                            bluestar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
                            bluestar.x + radius * cosf(theta),
                            bluestar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
                            bluestar.x + radius * cosf(theta),
                            bluestar.y - radius * sinf(theta)
                            );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
                            bluestar.x + radius * cosf(theta),
                            bluestar.y - radius * sinf(theta)
                            );
    
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);

    CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
    NSString *blue = NSLocalizedString(@"Blue", @"displayed with drawAtPoint");
    [blue drawAtPoint:CGPointMake(f.origin.x + 60, board.size.height + 120) withFont:[UIFont systemFontOfSize: 32]];
}


@end
