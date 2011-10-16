//
//  PadView.m
//  Hello
//
//  Created by Rebecca Har on 10/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PadView.h"


@implementation PadView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
	
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.9 alpha:1];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	[@"^_^" drawAtPoint:CGPointZero withFont:[UIFont boldSystemFontOfSize:30.0]];
	[@"Hello, app.  Here is some statistics info." drawAtPoint:CGPointMake(15.0, 50.5) withFont:[UIFont systemFontOfSize:32.2]];
	
	UIDevice *device = [UIDevice currentDevice];
	
	NSString *s1 = [NSString stringWithFormat:@"Model: %@", device.model];
	NSString *s2 = [NSString stringWithFormat:@"Identifier: %@", device.uniqueIdentifier];
	NSString *s3 = [NSString stringWithFormat:@"System Name: %@", device.systemName];
	NSString *s4 = [NSString stringWithFormat:@"System Version: %@", device.systemVersion];
	
	[s1 drawAtPoint:CGPointMake(15.0, 100) withFont: [UIFont systemFontOfSize:32]];
	[s2 drawAtPoint:CGPointMake(15.0, 132) withFont: [UIFont systemFontOfSize:32]];
	[s3 drawAtPoint:CGPointMake(15.0, 164) withFont: [UIFont systemFontOfSize:32]];
	[s4 drawAtPoint:CGPointMake(15.0, 196) withFont: [UIFont systemFontOfSize:32]];
	
	NSLog(@"drawRect: self.retainCount == %u", self.retainCount);
	
}


- (void)dealloc {
    [super dealloc];
}


@end
