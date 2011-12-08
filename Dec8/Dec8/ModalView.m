

#import "ModalView.h"
#import "ModalViewController.h"
#import "Restaurant.h"

@implementation ModalView

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c data:(Restaurant *)r
{
    
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		self.textAlignment = UITextAlignmentLeft;
		self.text = [NSString stringWithFormat:@"Type: %@\n Address: %@\n Phone: %@\n",r.Type, r.Address, r.Phone];
		self.userInteractionEnabled = NO;
		modalViewController = c;
	}
	return self;
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
