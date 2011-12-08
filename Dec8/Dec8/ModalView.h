
#import <UIKit/UIKit.h>
@class ModalViewController;
@class Restaurant;

@interface ModalView: UITextView
{
	ModalViewController *modalViewController;
}

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c data: (Restaurant *)r;
@end
