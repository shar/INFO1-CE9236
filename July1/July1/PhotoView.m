//
//  PhotoView.m
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoView.h"
#import "ViewController.h"

@implementation PhotoView

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
        
        btnShowTitle.tag = 1;
        
        [self addSubview:btnShowTitle];

        // chord info //
        UIImageView *achordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Achord.png"]];
        achordiv.center = CGPointMake(80,80);
        [self addSubview: achordiv];
        
        UIImageView *amchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Amchord.png"]];
        amchordiv.center = CGPointMake(280,80);
        [self addSubview: amchordiv];
        
        UIImageView *bchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bchord.png"]];
        bchordiv.center = CGPointMake(80,280);
        [self addSubview: bchordiv];
        
        UIImageView *bmchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bmchord.png"]];
        bmchordiv.center = CGPointMake(280,280);
        [self addSubview: bmchordiv];
        
        UIImageView *cchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cchord.png"]];
        cchordiv.center = CGPointMake(80,480);
        [self addSubview: cchordiv];
        
        UIImageView *dchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dchord.png"]];
        dchordiv.center = CGPointMake(80,680);
        [self addSubview: dchordiv];
        
        UIImageView *echordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Echord.png"]];
        echordiv.center = CGPointMake(80,880);
        [self addSubview: echordiv];
        
        UIImageView *fchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Fchord.png"]];
        fchordiv.center = CGPointMake(80,1080);
        [self addSubview: fchordiv];
        
        UIImageView *gchordiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Gchord.png"]];
        gchordiv.center = CGPointMake(80,1280);
        [self addSubview: gchordiv];
        

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
