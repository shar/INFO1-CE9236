//
//  MainView.h
//  Dec8
//
//  Created by Sukman Har on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface MainView : UIView
{
    MainViewController *mainViewController;
    //UITextField *textfield;
    UILabel *label;
    UIButton *button;
    NSArray *rdata;
}

- (id)initWithFrame:(CGRect)frame controller: (MainViewController *) mvc data:(NSArray *) data;
@end
