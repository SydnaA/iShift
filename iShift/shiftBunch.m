//
//  shiftBunch.m
//  iShift
//
//  Created by Andy Sheng on 12-10-25.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "shiftBunch.h"

@implementation shiftBunch 
@synthesize seg, txtf_1, txtf_2, arr;

#define segWidth 30;
#define segHeight 44;
#define segToTxt1DistanceX 280;
#define Txt1ToTxt2DistanceX 225;
#define txt2Width 330;
#define txt1Height 31;
#define txt1Width 75;


//20, 15, 200, 44

-(id) initWithBoundsAndArray:(CGRect)bounds:(int)segSel:(NSString *)txt1:(NSString *)txt2 {
    self = [super init];
    if (self != nil) {
        seg=[[UISegmentedControl alloc] init];
        [seg insertSegmentWithTitle:@"In" atIndex:0 animated:NO];
        [seg insertSegmentWithTitle:@"Out" atIndex:1 animated:NO];
        seg.selectedSegmentIndex=0;
        seg.segmentedControlStyle=UISegmentedControlStylePlain;
        seg.frame=bounds;
        bounds.origin.x+=25;
        bounds.size.height=txt1Height;
        bounds.size.width=txt1Width;
        txtf_1=[[UITextField alloc] initWithFrame:bounds];
        bounds.origin.x+=Txt1ToTxt2DistanceX;
        bounds.size.width=txt2Width;
        txtf_2=[[UITextField alloc] initWithFrame:bounds];
        [txtf_1 setTag:1];
        [txtf_2 setTag:2];
        [txtf_1 addTarget:self action:@selector(keyboardReturn:) forControlEvents:UIControlEventTouchUpOutside];
        [txtf_2 addTarget:self action:@selector(keyboardReturn:) forControlEvents:UIControlEventTouchUpOutside];
        [seg addTarget:self action:@selector(saveSeg) forControlEvents:UIControlEventValueChanged];
        if (txt1 != nil) {
            seg.selectedSegmentIndex=segSel;
            [txtf_1 setText:txt1];
            [txtf_2 setText:txt2];
            arr= [[NSArray alloc] initWithObjects: [NSString stringWithFormat:@"%i", segSel], txt1,  txt2, nil];
        }  else {
            arr= [[NSArray alloc] initWithObjects: [NSString stringWithFormat:@"%i", segSel], @"",  @"", nil];
        }
    }
    return self;
}

-(IBAction) keyboardReturn:(id)sender {
    [sender resignFirstResponder];
    
}

-(void)saveSeg {
    [[arr objectAtIndex:0] setString:[NSString stringWithFormat:@"%i", seg.selectedSegmentIndex]];
    return;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[arr objectAtIndex:textField.tag] setString:textField.text];
    [textField resignFirstResponder];
    return YES;
}

-(NSArray *)getArray {
    return arr;
}


@end
