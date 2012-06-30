//
//  SignupView.h
//  July1
//
//  Created by Sukman Har on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupView : UIView<UIAlertViewDelegate,UITextFieldDelegate>
{
    UIButton *btnShowAbout;
    UIButton *btnSubmit;
    UITextField *emailtf;
    NSString *emailstr;
}
@end
