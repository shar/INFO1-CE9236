//
//  PadView.h
//  TouchwithAnimeApp
//
//  Created by Sukman Har on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadView : UIView
{
    NSMutableArray *Chocobos;
    int hit;
    int counter;
    BOOL completed;
}

-(void)addChocoboImage;    
-(void)touched:(UIImageView *)iv;
@end
