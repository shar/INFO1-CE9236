//
//  PadView.m
//  Nov17
//
//  Created by Sukman Har on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//  master view
//

#import "PadView.h"

@implementation PadView

@synthesize volumnslider;
//@synthesize control;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        red = 1;
        green = 1;
        blue = 1;
        alpha = 1;
        
        //self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        
        self.backgroundColor = [UIColor whiteColor];
        
        // set up color chaning slider 
        float minvalue = 0;
        float maxvalue = 1;
        
        redslider = [[UISlider alloc] initWithFrame:CGRectMake(150, 16, self.bounds.size.width - 250, 16)];
        
        greenslider = [[UISlider alloc] initWithFrame:CGRectMake(150, 48, self.bounds.size.width - 250, 16)];
        
        blueslider = [[UISlider alloc] initWithFrame:CGRectMake(150,80, self.bounds.size.width - 250, 16)];
                
        //alphaslider = [[UISlider alloc] initWithFrame:CGRectMake(150,112, self.bounds.size.width - 250, 16)];
     
        volumnslider = [[UISlider alloc] initWithFrame:CGRectMake(150,112, self.bounds.size.width - 250, 16)];
        
        redslider.minimumValue = minvalue;
        greenslider.minimumValue = minvalue;
        blueslider.minimumValue = minvalue;
        //alphaslider.minimumValue = 0.5;
        volumnslider.minimumValue = minvalue;
        
        redslider.maximumValue = maxvalue;
        greenslider.maximumValue = maxvalue;
        blueslider.maximumValue = maxvalue;
        //alphaslider.maximumValue = maxvalue;
        volumnslider.maximumValue = maxvalue;
        
        redslider.value = red;
        greenslider.value = green;
        blueslider.value = blue;
        alphaslider.value = alpha;
        
        redslider.continuous = NO;
        greenslider.continuous = NO;
        blueslider.continuous = NO;
        //alphaslider.continuous = NO;
        volumnslider.continuous = YES;
        
        [redslider addTarget:self action:@selector(redValueChanged:) forControlEvents:UIControlEventValueChanged];
        [greenslider addTarget:self action:@selector(greenValueChanged:) forControlEvents:UIControlEventValueChanged];
        [blueslider addTarget:self action:@selector(blueValueChanged:) forControlEvents:UIControlEventValueChanged];
        //[alphaslider addTarget:self action:@selector(alphaValueChanged:) forControlEvents:UIControlEventValueChanged];
        [volumnslider addTarget:[UIApplication sharedApplication].delegate action:@selector(volumeChanged:) forControlEvents:UIControlEventValueChanged];
        
        volumnslider.value = 1.0;
        
        [self addSubview:redslider];
        [self addSubview:greenslider];
        [self addSubview:blueslider];
        //[self addSubview:alphaslider];
        [self addSubview:volumnslider];
        
        textview = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, self.bounds.size.width -40, self.bounds.size.height / 2)];
        textview.editable = NO;
        textview.font = [UIFont systemFontOfSize: 20];
        //textview.text = @"";
        [self addSubview:textview];
        
        NSArray *composers = [NSArray arrayWithObjects:
                              @"Bach", 
                              @"Beethoven", 
                              @"Chopin",
                              @"Mozart", 
                              nil];
        
        control = [[UISegmentedControl alloc] initWithItems:composers];
        control.segmentedControlStyle = UISegmentedControlStyleBordered;
        
        control.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, 950);
        
        // play music
        [control addTarget:[UIApplication sharedApplication].delegate action:@selector(playMusic:) forControlEvents:UIControlEventValueChanged];
        
        // display text 
        [control addTarget:self action:@selector(displayBio:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:control];
        
        // add button
        stopbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        replaybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        stopbutton.frame = CGRectMake(630, 930, 100, 40);
        replaybutton.frame = CGRectMake(30, 930, 100, 40);
        
        [stopbutton setTitle:@"Stop" forState:UIControlStateNormal];
        [replaybutton setTitle:@"Resume" forState:UIControlStateNormal];
        
        [stopbutton addTarget:[UIApplication sharedApplication].delegate action:@selector(stopMusic:) forControlEvents:UIControlEventTouchUpInside];
        [replaybutton addTarget:[UIApplication sharedApplication].delegate action:@selector(replayMusic:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:stopbutton];
        [self addSubview:replaybutton];
    }
    return self;
}

-(void) displayBio: (id) sender 
{
    UISegmentedControl *control = sender;
    
	switch (control.selectedSegmentIndex) 
    {
        case 0:
            textview.text = @"Johann Sebastian Bach was a German composer, organist, harpsichordist, violist, and violinist whose sacred and secular works for choir, orchestra, and solo instruments drew together the strands of the Baroque period and brought it to its ultimate maturity.[2] Although he did not introduce new forms, he enriched the prevailing German style with a robust contrapuntal technique, an unrivalled control of harmonic and motivic organisation, and the adaptation of rhythms, forms and textures from abroad, particularly from Italy and France.";
            break;
        case 1:
            textview.text = @"Ludwig van Beethoven was a German composer and pianist. A crucial figure in the transition between the Classical and Romantic eras in Western art music, he remains one of the most famous and influential composers of all time.\n Born in Bonn, then the capital of the Electorate of Cologne and part of the Holy Roman Empire, Beethoven moved to Vienna in his early 20s, studying with Joseph Haydn and quickly gaining a reputation as a virtuoso pianist. His hearing began to deteriorate in the late 1790s, yet he continued to compose, conduct, and perform, even after becoming completely deaf.";
            break;
        case 2:
            textview.text = @"Frédéric François Chopin was a Polish composer and virtuoso pianist. He is considered one of the great masters of Romantic music and has been called \"the poet of the piano\".\n Chopin was born in Żelazowa Wola, a village in the Duchy of Warsaw, to a Polish mother and French-immigrant father. A renowned child-prodigy pianist and composer, he grew up in Warsaw and completed his musical education there. Following the Russian suppression of the Polish November 1830 Uprising, he settled in Paris as part of the Great Emigration. He supported himself as a composer and piano teacher, giving few public performances. From 1837 to 1847 he carried on a relationship with the French woman writer George Sand. For most of his life, Chopin suffered from poor health; he died in Paris in 1849 at the age of 39.";
            break;
        case 3:
            textview.text = @"Wolfgang Amadeus Mozart was a prolific and influential composer of the Classical era. He composed over 600 works, many acknowledged as pinnacles of symphonic, concertante, chamber, piano, operatic, and choral music. He is among the most enduringly popular of classical composers.\n Mozart showed prodigious ability from his earliest childhood in Salzburg. Already competent on keyboard and violin, he composed from the age of five and performed before European royalty. At 17, he was engaged as a court musician in Salzburg, but grew restless and travelled in search of a better position, always composing abundantly. While visiting Vienna in 1781, he was dismissed from his Salzburg position. He chose to stay in the capital, where he achieved fame but little financial security. During his final years in Vienna, he composed many of his best-known symphonies, concertos, and operas, and portions of the Requiem, which was largely unfinished at the time of Mozart's death. The circumstances of his early death have been much mythologized.";
            break;
        default:
            break;
    }        

}

-(void) redValueChanged: (id) sender 
{
    UISlider *s = sender;
    
    red = s.value;
    
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    textview.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

}

-(void) greenValueChanged: (id) sender 
{
    UISlider *s = sender;
    
    green = s.value;
    
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   
    
    textview.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   
}

-(void) blueValueChanged: (id)sender
{
    UISlider *s = sender;
    
    blue = s.value;
    
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   
    
    textview.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   


}

-(void) alphaValueChanged: (id)sender
{
    UISlider *s = sender;
    
    alpha = s.value;
    
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   
    
    textview.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];   

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [@"Red: " drawAtPoint:CGPointMake(20, 16) withFont:[UIFont systemFontOfSize:20]];
    [@"Green: " drawAtPoint:CGPointMake(20, 48) withFont:[UIFont systemFontOfSize:20]];
    [@"Blue: " drawAtPoint:CGPointMake(20, 80) withFont:[UIFont systemFontOfSize:20]];
    //[@"Alpha: " drawAtPoint:CGPointMake(20, 112) withFont:[UIFont systemFontOfSize:20]];
    [@"Volume: " drawAtPoint:CGPointMake(20, 112) withFont:[UIFont systemFontOfSize:20]];
}


@end
