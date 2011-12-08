//
//  Restaurant.m
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Restaurant.h"


@implementation Restaurant
{
    
}

@synthesize Name;
@synthesize Type;
@synthesize Address;
@synthesize Phone;

-(id)initWithName: (NSString *) name Type: (NSString *) type Address: (NSString *) address Phone: (NSString *) phone
{
        Name = name;
        Type = type;
        Address = address;
        Phone = phone;
    
    
    return self;
}

@end
