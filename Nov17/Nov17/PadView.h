//
//  PadView.h
//  Nov17
//
//  Created by Sukman Har on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadView : UIView
{
    UISlider *redslider;
    UISlider *greenslider;
    UISlider *blueslider;
    UISlider *alphaslider;
    UISlider *volumnslider;
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    UITextView *textview;
    UISegmentedControl *control;
    
    UIButton *stopbutton;
    UIButton *replaybutton;
}


@property (strong, nonatomic) UISlider *volumnslider;
//@property (strong, nonatomic) UISegmentedControl *control;

@end
