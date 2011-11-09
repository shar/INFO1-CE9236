//
//  SubView0.m
//  Nov10
//
//  Created by Sukman Har on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//  Play with spread and pinch
//

#import "SubView0.h"

@implementation SubView0

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImage *i = [UIImage imageNamed:@"moogle.jpg"];
        imageview = [[UIImageView alloc] initWithImage:i];

        // put image at the middle
        imageview.center = CGPointMake(self.bounds.size.width/1.5, self.bounds.size.height/1.5);
        
        [self addSubview: imageview];
        
        UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];

        [self addGestureRecognizer:recognizer];
        
        UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twotap:)];
        doubletap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubletap];
        
        
        UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onetap:)];
        singletap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singletap];
        [singletap requireGestureRecognizerToFail:doubletap];
        
        UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0,0, self.bounds.size.width, self.bounds.size.height/3 )];
        
        textview.text = @"Welcome.\n\n*Swipe up or left to go to next page"
                    @"\n*Swipe down or right to go to previous page\n"
                    @"*Pinch or spread the character to change its size"
    @"\n*Double Tap to change image\n"
        @"*Single Tap to change back\n";
        textview.font = [UIFont systemFontOfSize: 32];
        
        [self addSubview:textview];
                                               
    }
    return self;
}

-(void)onetap:(UITapGestureRecognizer *) recognizer
{
    NSLog(@"one tap");
    imageview.image = [UIImage imageNamed:@"moogle.jpg"];
}

-(void)twotap:(UITapGestureRecognizer *) recognizer
{
    NSLog(@"two tap");    
    imageview.image = [UIImage imageNamed:@"chocobo.jpg"];
}

-(void)pinch:(UIPinchGestureRecognizer *) recognizer 
{
    factor = [recognizer scale];
    NSLog(@"value=%f", factor);
    
    imageview.transform = CGAffineTransformScale(imageview.transform , factor, factor);;
       
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
}


@end
