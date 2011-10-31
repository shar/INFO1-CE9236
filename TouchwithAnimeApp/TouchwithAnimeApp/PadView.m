//
//  PadView.m
//  
//
//  Created by Sukman Har on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PadView.h"
#import <QuartzCore/QuartzCore.h> // need to use this library to use presentationlayer in core animation

@implementation PadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.backgroundColor = [UIColor whiteColor];
        hit = 0;
        counter = 0;
        
        int total = 100;
        completed = NO;
        
        Chocobos = [[NSMutableArray alloc] init];

        //[self addChocoboImage];
        
        // add more images
        for (int i=1; i<=total; i++)
        {
            [self performSelector:@selector(addChocoboImage) withObject:nil afterDelay:i];
        }
        
        [self performSelector:@selector(finish) withObject:nil afterDelay:total + 2];
        
    }
    
    return self;
}

-(void)finish 
{
    [Chocobos removeAllObjects];
    completed = YES;
    [self setNeedsDisplay];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint point = [touch locationInView:self];
        
        //NSLog(@" my touch at x = %g, y=%g", point.x, point.y);
        
        
        for (int i=0 ; i <=Chocobos.count -1; i++)
        {
            UIImageView *iv = [Chocobos objectAtIndex:i];
            
            CGRect cframe = [[iv.layer presentationLayer] frame];
        
            // center
            CGPoint cpoint = CGPointMake(cframe.origin.x + cframe.size.width / 2, cframe.origin.y + cframe.size.height / 2);
            
            // compute distance 
            float distance = pow(cpoint.x - point.x, 2) + pow(cpoint.y - point.y, 2);
            distance = sqrt(distance);
            
            if ( distance <= cframe.size.width /2 ) 
            {
                [self touched:iv];
            }
            
            //NSLog(@"count %g", Chocobos.count);
            //NSLog(@"rframe location at x=%g, y=%g", iv.frame.origin.x, iv.frame.origin.y);
            //NSLog(@"cframe location at x=%g, y=%g", cframe.origin.x, cframe.origin.y);
            
            
        }
        
    }
}

-(void)touched:(UIImageView *) iv
{
    // once hit, update the image
    iv.image = [UIImage imageNamed:@"moogle.jpg"];
    hit++;
    
    //NSLog(@"# of hits: %u", hit);
    [self setNeedsDisplay];
}

-(void)addChocoboImage 
{
    // pick random spot
    float viewwidth = self.bounds.size.width;
    float viewheight = self.bounds.size.height;
    
    float x = random() % (int)viewwidth;
    float y = random() % (int)viewheight;
    
    // create an image view
    UIImage *i = [UIImage imageNamed:@"chocobo.jpg"];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, i.size.width/5, i.size.height/5)];
    iv.image = i;
    
    [Chocobos addObject:iv];
    [self addSubview:iv];
    
    [self performSelector:@selector(beginChocoboImageAnimation:) withObject:iv afterDelay:0.01];
    
    counter++;
    [self setNeedsDisplay];
    //NSLog(@"original image location at x=%g, y=%g", iv.frame.origin.x, iv.frame.origin.y);
    
    //NSLog(@"original count %u", Chocobos.count);
    
    
}


-(void)beginChocoboImageAnimation:(UIImageView *) iv 
{
     
    [UIView animateWithDuration: 1
                          delay: 0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         iv.center = CGPointMake(
                                                    -iv.bounds.size.width,
                                                    self.bounds.size.height
                                                    );
                     }
                     completion: NULL
	 ];
        
    
    
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIFont *f = [UIFont systemFontOfSize: 32.0];
    UIFont *f2 = [UIFont systemFontOfSize: 64.0];
    
    NSString *s1 = [NSString stringWithFormat:@"Total number: %u", counter];    
    CGPoint p1 = CGPointMake(0.0, 0.0);
    [s1 drawAtPoint: p1 withFont: f];
    
    NSString *s2 = [NSString stringWithFormat:@"# of hits: %u", hit];    
    CGPoint p2 = CGPointMake(0.0, 40.0);
    [s2 drawAtPoint: p2 withFont: f];
    
    if ( completed ) 
    {
        [@"FINISH" drawAtPoint:CGPointMake(self.bounds.size.width/2 - 64, self.bounds.size.height/2 -64) withFont:f2];
    }
    
}


@end
