//
//  MainView.m
//  July8
//
//  Created by Sukman Har on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "ViewController.h"

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        btnStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnStart.frame = CGRectMake(550, 50, 200, 40);
        
        btnStart.center = self.center;
        [btnStart setTitle:@"Start" forState:UIControlStateNormal];
        
        
        [btnStart   addTarget:self 
                     action:@selector(Start:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btnStart];
   
        // add cheese //
        ivCheese = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cheese.jpg"]];
        
        
        ivCheese.frame = CGRectMake(600, 40, 100, 100);
        
        [self addSubview: ivCheese];
        
        // add mouse hole //
        ivMousehole = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mousehole.gif"]];
        
        
        ivMousehole.frame = CGRectMake(700, 800, 74, 187);
        
        [self addSubview: ivMousehole];
        
        
        // add mouse //
        ivMouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]];
        
        ivMouse.frame = CGRectMake(50, 850, 75, 75);
        
        [self addSubview: ivMouse];
        
        // add brick //
        ivBrickTop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.gif"]];
        
        ivBrickTop.frame = CGRectMake(200, 200, 600, 100);
        
        [self addSubview: ivBrickTop];

        
        ivBrickButtom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.gif"]];
        
        ivBrickButtom.frame = CGRectMake(0, 700, 300, 60);
        
        [self addSubview: ivBrickButtom];
        
        // text view //
        tv = [[UITextView alloc] initWithFrame:CGRectMake(self.frame.origin.x/2, self.frame.origin.y/2, 500, 500)];
        tv.backgroundColor = [UIColor blueColor];
        UIFont *font = [UIFont systemFontOfSize: 32];
        tv.font = font;
        tv.text = @"FINISH";
        tv.textColor = [UIColor whiteColor];
        tv.center = self.center;
        tv.hidden = YES;
        [self addSubview:tv];


        
    }

    return self;
}

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration 
              curve:(int)curve degrees:(CGFloat)degrees
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = 
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

-(void)Start: (id)sender 
{
    btnStart.hidden = YES;
    
    // garfield sleeping //
    ivGarfield = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 260,200)];
    
    ivGarfield.center = self.center;
    
    // load all the frames of our animation
    ivGarfield.animationImages = [NSArray arrayWithObjects:    
                                //[UIImage imageNamed:@"garfield.gif"],
                                [UIImage imageNamed:@"garfield_z.gif"],
                                [UIImage imageNamed:@"garfield_zz.gif"],
                                [UIImage imageNamed:@"garfield_zzz.gif"],
                                nil];
    
   ivGarfield.animationDuration = 2.0;

    // anime forever
    ivGarfield.animationRepeatCount = 0;
    
    // start animating
    [ivGarfield startAnimating];
    // add the animation view to the main window 
    
    [self addSubview:ivGarfield];
    

    /* animation block 
     [UIView animateWithDuration:1.0 
     delay:0.0 
     options:UIViewAnimationOptionCurveLinear 
     animations:^{
     // initial turn around //
     [self rotateImage:ivMouse duration:1.0 
     curve:UIViewAnimationCurveEaseIn degrees:-90]; 
     } 
     completion:^(BOOL finished) {}];
*/
    
    [UIView animateWithDuration:1.0 
            delay:0.0 
            options:UIViewAnimationOptionCurveLinear 
            animations:^{
                // initial turn around //
                [self rotateImage:ivMouse duration:1.0 
                            curve:UIViewAnimationCurveEaseIn degrees:-90]; 
                     } 
            completion:^(BOOL finished) {
                        
                [UIView animateWithDuration:2.0 
                        delay:2.0 
                        options:UIViewAnimationOptionCurveLinear 
                        animations:^{
                            // go to mouse house //
                            ivMouse.center = CGPointMake(400, 850);
                            } 
                        completion:^(BOOL finished) {
                            [UIView animateWithDuration:1.0 
                                                  delay:2.0 
                                                options:UIViewAnimationOptionCurveLinear 
                                             animations:^{
                                                 // initial turn around //
                                                 [self rotateImage:ivMouse duration:1.0 
                                                             curve:UIViewAnimationCurveEaseIn degrees:180]; 
                                             } 
                                             completion:^(BOOL finished) {
                                                 [UIView animateWithDuration:1.0 
                                                                       delay:1.0 
                                                                     options:UIViewAnimationOptionCurveLinear 
                                                                  animations:^{
                                                                      ivMouse.center = CGPointMake(400, 650);
                                                                  } 
                                                                  completion:^(BOOL finished) {
                                [UIView animateWithDuration:1.0 
                                        delay:1.0 
                                        options:UIViewAnimationOptionCurveLinear 
                                        animations:^{
                                                                                           // initial turn around //
                                            [self rotateImage:ivMouse duration:1.0 
                                            curve:UIViewAnimationCurveEaseIn degrees:90]; 
                                            } 
                                            completion:^(BOOL finished) {
                                            
                                                [UIView animateWithDuration:2.0 
                                                                      delay:1.0 
                                                                    options:UIViewAnimationOptionCurveLinear 
                                                                 animations:^{
                                                                     ivMouse.center = CGPointMake(80, 650); 
                                                                 } 
                                                                 completion:^(BOOL finished) {
                                              [UIView animateWithDuration:2.0 
                                                                    delay:2.0 
                                                          options:UIViewAnimationOptionCurveLinear 
                                                          animations:^{
                                                                                          // initial turn around //
                                                          [self rotateImage:ivMouse duration:1.0 
                                                          curve:UIViewAnimationCurveEaseIn degrees:180]; 
                                                          } 
                                                                                      completion:^(BOOL finished) {
                                        
                                                [UIView animateWithDuration:2.0 
                                                delay:1.0 
                                                options:UIViewAnimationOptionCurveLinear 
                                                animations:^{
                                                    ivMouse.center = CGPointMake(80, 100); 
                                                } 
                                                completion:^(BOOL finished) {
                                                    [UIView animateWithDuration:2.0 
                                                                          delay:2.0 
                                                                        options:UIViewAnimationOptionCurveLinear 
                                                                     animations:^{
                                                                         // initial turn around //
                                                                         [self rotateImage:ivMouse duration:1.0 
                                                                                     curve:UIViewAnimationCurveEaseIn degrees:-90]; 
                                                                     } 
                                                                     completion:^(BOOL finished) {
                                                                     
                                                        [UIView animateWithDuration:2.0 
                                                        delay:1.0 
                                                        options:UIViewAnimationOptionCurveLinear 
                                                        animations:^{
                                                            ivMouse.center = CGPointMake(580, 100); 
                                                        } 
                                                        completion:^(BOOL finished) {
                                                        
                                            [UIView animateWithDuration:2.0 
                                            delay:0.0 
                                            options:UIViewAnimationOptionCurveLinear 
                                            animations:^{
                                            // initial turn around //
                                                ivCheese.alpha = 0; 
                                            } 
                                            completion:^(BOOL finished) {
                                            
                                                [UIView animateWithDuration:1.0 
                                                                      delay:2.0 
                                                                    options:UIViewAnimationOptionCurveLinear 
                                                                 animations:^{
                                                                     // initial turn around //
                                                                     [self rotateImage:ivMouse duration:1.0 
                                                                                 curve:UIViewAnimationCurveEaseIn degrees:90]; 
                                                                 } 
                                                                 completion:^(BOOL finished) {
                                                                 
                                                                     [UIView animateWithDuration:2.0 
                                                                                           delay:1.0 
                                                                                         options:UIViewAnimationOptionCurveLinear 
                                                                                      animations:^{
                                                                                          // initial turn around //
                                                                                          ivMouse.center = CGPointMake(80, 100);
                                                                                      } 
                                                                                      completion:^(BOOL finished) {
                                [UIView animateWithDuration:1.0 
                                delay:0.0 
                                options:UIViewAnimationOptionCurveLinear 
                                animations:^{
                                [self rotateImage:ivMouse duration:1.0 
                                curve:UIViewAnimationCurveEaseIn degrees:0]; 
                                } 
                                completion:^(BOOL finished) {
                                    [UIView animateWithDuration:1.0 
                                                          delay:1.0 
                                                        options:UIViewAnimationOptionCurveLinear 
                                                     animations:^{
                                                         // initial turn around //
                                                         ivMouse.center = CGPointMake(80, 370); 
                                                     } 
                                                     completion:^(BOOL finished) {
                                                         [UIView animateWithDuration:1.0 
                                                                               delay:1.0 
                                                                             options:UIViewAnimationOptionCurveLinear 
                                                                          animations:^{
                                                                              // initial turn around //
                                                                              [self rotateImage:ivMouse duration:1.0 
                                                                                          curve:UIViewAnimationCurveEaseIn degrees:-90]; 
                                                                          } 
                                                                          completion:^(BOOL finished) {
                                                                          
             [UIView animateWithDuration:2.0 
               delay:1.0 
               options:UIViewAnimationOptionCurveLinear 
               animations:^{
                   ivMouse.center = CGPointMake(650, 370); 
               } 
               
               completion:^(BOOL finished) {
               
                   [UIView animateWithDuration:1.0 
                                         delay:1.0 
                                       options:UIViewAnimationOptionCurveLinear 
                                    animations:^{
                                        // initial turn around //
                                        [self rotateImage:ivMouse duration:1.0 
                                                    curve:UIViewAnimationCurveEaseIn degrees:0]; 
                                    } 
                                    completion:^(BOOL finished) {
                                    
                                        [UIView animateWithDuration:1.0 
                                                              delay:1.0 
                                                            options:UIViewAnimationOptionCurveLinear 
                                                         animations:^{
                                                             ivMouse.center = CGPointMake(650, 900);
                                                         } 
                                                         completion:^(BOOL finished) {
                                                         
            [UIView animateWithDuration:1.0 
            delay:1.0 
            options:UIViewAnimationOptionCurveLinear 
            animations:^{
                               
                tv.alpha = 1.0;
            } 
            completion:^(BOOL finished) {
                
                
                [UIView animateWithDuration:5.0 
                                      delay:0.0 
                                    options:UIViewAnimationOptionCurveLinear 
                                 animations:^{
                                     // return to original state //
                                     tv.hidden = NO;
                                     tv.alpha = 0;
                                     ivGarfield.hidden = YES;
                                     ivMouse.center = CGPointMake(50, 850);
                                     ivCheese.alpha = 1;
                                 } 
                                 completion:^(BOOL finished) {
                                 
                                     btnStart.hidden = NO;
                                 }];

            
            }];

                                                         
                                                         }];

                                    }];
               }];
                                                                          
                                                                          }];
                    
                                                     
                                                     }];

                                
                                }];
                                                                                      
                                                                                      }];

                                                                     
                                                                 
                                                                 }];
                                            
                                            }];
                                                        }];

                                                                     }];

                                                    
                                                }];

                                        }];
                                                                 
                                                                 }];
                                            }];
                                                                
                                                    }];
                        
                                             
                                             }];
                                     
                        }
                 ];

            }
     ];
    
    
    
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c {
	self = [super initWithFrame: frame];
    
    if (self) 
    {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		viewController = c;
        
        [self addSubview:[[MainView alloc] initWithFrame:self.bounds]]; 
        
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
