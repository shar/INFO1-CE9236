//
//  main.m
//  Hello
//
//  Created by Rebecca Har on 10/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSLog(@"...Program starts...");
	
    int retVal = UIApplicationMain(argc, argv, nil, @"HelloAppDelegate");
	

    [pool release];
    return retVal;
}
