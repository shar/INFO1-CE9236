//
//  TitleView.m
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TitleView.h"
#import "ViewController.h"

@implementation TitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        NSString *string = @"Guitar Chord";
		UIFont *font = [UIFont systemFontOfSize: 32];
		CGSize labelsize = [string sizeWithFont: font];
        
		//Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                              (self.bounds.size.width - labelsize.width)/ 2,
                              self.bounds.origin.y,
                              labelsize.width,
                              labelsize.height
                              );
        
		AboutLabel = [[UILabel alloc] initWithFrame: f];
		AboutLabel.backgroundColor = [UIColor whiteColor];
		AboutLabel.font = font;
		AboutLabel.text = string;
		[self addSubview: AboutLabel];
        
        UIImage *guitarimage = [UIImage imageNamed:@"guitar.jpg"];
        GuitarIV = [[UIImageView alloc] initWithImage:guitarimage];
        
        GuitarIV.center = CGPointMake(self.bounds.size.width /2,
            250);
      
        [self addSubview: GuitarIV];
        
        btnAbout = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [btnAbout setTitle:@"About" forState:UIControlStateNormal];
        [btnPhoto setTitle:@"Chord Chart" forState:UIControlStateNormal];
        
        btnAbout.frame = CGRectMake(100, self.bounds.size.height /2, 200, 40);
        btnPhoto.frame = CGRectMake(450, self.bounds.size.height /2, 200, 40);

        [btnAbout addTarget:self.superview
                     action:@selector(ShowAbout:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnPhoto addTarget:self.superview 
                     action:@selector(ShowPhoto:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btnPhoto];
        [self addSubview:btnAbout];
        
        
    }
    return self;
}

/*
- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c {
	self = [super initWithFrame: frame];
	
    if (self) 
    {
		// Initialization code
		self.backgroundColor = [UIColor blackColor];
		viewController = c;
        
        [self addSubview:[[TitleView alloc] initWithFrame:self.bounds]]; 
        
	}
	return self;
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
