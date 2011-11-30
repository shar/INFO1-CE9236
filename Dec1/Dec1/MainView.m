//
//  MainView.m
//  Dec1
//
//  Created by Sukman Har on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MainViewController.h"
@implementation MainView

- (id)initWithFrame:(CGRect)frame controller: (MainViewController *) c
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        self = [super initWithFrame: frame];

        if (self) 
        {
            NumBlock = 0;
            carrotcount =0;
            gamefinish = NO;
            
            // Initialization code
            self.backgroundColor = [UIColor whiteColor];
            
            // define the parent controller
            mvc = c;
            
            //Create the ball in the upper left corner of this View.
            UIImage *i = [UIImage imageNamed:@"moogle.jpg"];
            
            CGRect mframe = CGRectMake((self.bounds.size.width -100)/2, 50, 80, 80);
            moogleiv = [[UIImageView alloc] initWithFrame: mframe];
            moogleiv.backgroundColor = [UIColor whiteColor];
            moogleiv.image = i;
            [self addSubview: moogleiv];
        
            /*
            UIImage *fireball_i = [UIImage imageNamed:@"Fire_ball.png"];
            CGRect fframe = CGRectMake(50,50,50,50);
            fireballiv = [[UIImageView alloc] initWithFrame:fframe];
            fireballiv.image = fireball_i;
            [self addSubview:fireballiv];
            fx=3;
            fy=3;
            */
            
            UIImage *iceball_i = [UIImage imageNamed:@"Ice_Ball.png"];
            CGRect iframe = CGRectMake(50, 50, 30, 30);
            iceballiv = [[UIImageView alloc] initWithFrame:iframe];
            iceballiv.image = iceball_i;
            [self addSubview:iceballiv];
            ix = 4;
            iy = 4;
            
            // add direction button
            UIButton *upbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            UIImage *upimage = [UIImage imageNamed:@"up_arrow.jpg"];
            [upbutton setBackgroundImage: upimage forState:UIControlStateNormal];
             
             upbutton.frame = CGRectMake(
                                      50,0,50,50
                                      );
            [upbutton addTarget: self
                       action: @selector(moveUp:)
             forControlEvents: UIControlEventTouchUpInside
             ];
            
            [self addSubview: upbutton];
            
            UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            UIImage *leftimage = [UIImage imageNamed:@"left_arrow.jpg"];
            [leftbutton setBackgroundImage: leftimage forState:UIControlStateNormal];
            
            leftbutton.frame = CGRectMake(
                                        0,50,50,50
                                        );
            
            [leftbutton addTarget: self
                         action: @selector(moveLeft:)
               forControlEvents: UIControlEventTouchUpInside
             ];

            [self addSubview: leftbutton];
            
            
            UIButton *downbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            UIImage *downimage = [UIImage imageNamed:@"down_arrow.jpg"];
            [downbutton setBackgroundImage: downimage forState:UIControlStateNormal];
            
            downbutton.frame = CGRectMake(
                                          50,100,50,50
                                          );
            
            [downbutton addTarget: self
                         action: @selector(moveDown:)
               forControlEvents: UIControlEventTouchUpInside
             ];

            [self addSubview: downbutton];
            
            
            UIButton *rightbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            UIImage *rightimage = [UIImage imageNamed:@"right_arrow.jpg"];
            [rightbutton setBackgroundImage: rightimage forState:UIControlStateNormal];
            
            rightbutton.frame = CGRectMake(
                                          100,50,50,50
                                          );
            [rightbutton addTarget: self
                         action: @selector(moveRight:)
               forControlEvents: UIControlEventTouchUpInside
             ];

            [self addSubview: rightbutton];
            
            // add carrots 
            carrots = [[NSMutableArray alloc] init];
            
            for (int i=1; i<=3; i++)
            {
                for ( int j=1; j<=4; j++)
                {
                                
                float x = (i) * 200 ;
                float y = (j) * 200 ;
                
                // create an image view
                UIImage *ci = [UIImage imageNamed:@"carrot.gif"];
                
                UIImageView *civ = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 40, 40)];
                civ.image = ci;
                
                [carrots addObject:civ];
                [self addSubview:civ];
                }
            }
        }
        
        return self;                 
    }
    
    return self;
}

- (void) moveUp: (id) sender 
{
    mx = 0;
    my = -1;
    
}

-(void) moveDown: (id) sender
{
    mx = 0;
    my = 1;

}

-(void) moveLeft: (id) sender
{
    mx = -1;
    my = 0;
   
}

-(void) moveRight: (id) sender
{
    mx = 1;
    my = 0;

}

- (void) gameloop {	
	// moogle view
    CGRect mhorizontal = moogleiv.frame;
	mhorizontal.origin.x += mx;
	
	CGRect mvertical = moogleiv.frame;
	mvertical.origin.y += my;
	
	if (!CGRectEqualToRect(mhorizontal, CGRectIntersection(mhorizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		//dx = -dx;
        //dy = -1;
        mx=0;
        my=0;
	}
	
	if (!CGRectEqualToRect(mvertical, CGRectIntersection(mvertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		//dy = -dy;
        //dx = -1;
        mx=0;
        my=0;
	}

    /*
	// fireball view
    CGRect fhorizontal = fireballiv.frame;
    fhorizontal.origin.x += fx;
    
    CGRect fvertical = fireballiv.frame;
    fvertical.origin.y += fy;
    
    if (!CGRectEqualToRect(fhorizontal, CGRectIntersection(fhorizontal, self.bounds))) {
        fx=-fx;
         
	}
	
	if (!CGRectEqualToRect(fvertical, CGRectIntersection(fvertical, self.bounds))) {
        fy=-fy;
         
	}
    */
    
    // iceball view
    CGRect ihorizontal = iceballiv.frame;
    ihorizontal.origin.x += ix;
    
    CGRect ivertical = iceballiv.frame;
    ivertical.origin.y += iy;
    
    if (!CGRectEqualToRect(ihorizontal, CGRectIntersection(ihorizontal, self.bounds))) {
        ix=-ix-2;
        
	}
	
	if (!CGRectEqualToRect(ivertical, CGRectIntersection(ivertical, self.bounds))) {
        iy=-iy-2;
	}
        
    // detect collision //
    // for carrot 
    for (int i=0 ; i <=carrots.count -1; i++)
    {
        UIImageView *iv = [carrots objectAtIndex:i];
        
        if (CGRectIntersectsRect(iv.frame, moogleiv.frame) == 1)
        {    
            // add sound effect and remove carrot //
            [mvc playcrunchsound];
            [iv removeFromSuperview];
            iv.frame = CGRectZero;
            carrotcount++;
        }
        
    }
    
    
    if ( carrotcount == 12 ) {
        gamefinish = YES;
    
    }
    // if collide with fireball //
    // lose //
    //if (CGRectIntersectsRect(fireballiv.frame, moogleiv.frame) == 1)
    //{  
        
    //}
    
    
    
    // if collide with iceball //
    // bound off //
    if (CGRectIntersectsRect(iceballiv.frame, moogleiv.frame) == 1)
    {  
        moogleiv.center = CGPointMake((self.bounds.size.width - moogleiv.bounds.size.width) /2, 50);
        NumBlock++;
        [mvc playbouncesound];

    }

    
   }

- (void) play: (CADisplayLink *) displayLink {
	
    if (!gamefinish) 
    {
        moogleiv.hidden = NO;
        iceballiv.hidden = NO;

	moogleiv.center = CGPointMake(moogleiv.center.x + mx, moogleiv.center.y + my);
    //fireballiv.center = CGPointMake(fireballiv.center.x + fx, fireballiv.center.y + fy);
    iceballiv.center = CGPointMake(iceballiv.center.x + ix, iceballiv.center.y + iy);
	[self gameloop];
    } 
    else
    {
        moogleiv.hidden = YES;
        iceballiv.hidden = YES;
    }
    
    [self setNeedsDisplay];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //NSString *s1 = [NSString stringWithFormat:@"Time: "];

    //[s1 drawAtPoint:CGPointMake(0, self.bounds.size.height -120) withFont:[UIFont systemFontOfSize:32]];
    
    NSString *s2 = [NSString stringWithFormat:@"# of blocks: %u", NumBlock];
    
    [s2 drawAtPoint:CGPointMake(0, self.bounds.size.height -80) withFont:[UIFont systemFontOfSize:32]];
    
    NSString *s3 = [NSString stringWithFormat:@"# of carrots eaten: %u", carrotcount];
    
    [s3 drawAtPoint:CGPointMake(0, self.bounds.size.height -40) withFont:[UIFont systemFontOfSize:32]];
    
    if ( gamefinish )
    {
        NSString *finish = [NSString stringWithFormat:@"GAME OVER"];
        [finish drawAtPoint:CGPointMake(0, self.bounds.size.height/2) withFont:[UIFont systemFontOfSize:72]];
    }

}


@end
