//
//  MainView.h
//  July8
//
//  Created by Sukman Har on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface MainView : UIView
{
    ViewController *viewController;    
    
    UIButton *btnStart;
    UIImageView *ivMouse;
    UIImageView *ivCheese;
    UIImageView *ivMousehole;
    UIImageView *ivGarfield;
    UIImageView *ivBrickButtom;
    UIImageView *ivBrickTop;
    UITextView *tv;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
@end
