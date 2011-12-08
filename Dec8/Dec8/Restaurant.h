//
//  Restaurant.h
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject
{
    NSString *Name;
    NSString *Type;
    NSString *Address;
    NSString *Phone;
}

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Type;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *Phone;

-(id)initWithName: (NSString *) name Type: (NSString *) type Address: (NSString *) address Phone: (NSString *) phone;
@end
