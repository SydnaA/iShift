//
//  shift.m
//  iShift
//
//  Created by Andy Sheng on 12-10-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "shift.h"

@implementation shift
@synthesize button_1, button_2, button_3, button_4, button_5, button_6, button_7, button_8, button_9, button_10, button_11, button_12, button_13, button_14, button_15, button_16, button_17, button_18;
int numbers[18];

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self initArray];
    //[self loadArray];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}
-(void) viewWillDisappear {
    [self initArray];
}

- (IBAction)ChangeColor:(id)sender 
{
    UIButton *button = (UIButton *)sender;
    
    if([[UIImage imageNamed:@"BLUE.png"] isEqual:button.currentBackgroundImage]) {
        [button setBackgroundImage:[UIImage imageNamed:@"RED.png"] forState:UIControlStateNormal];
        [self setArray:button.tag :2];
    } else if([[UIImage imageNamed:@"RED.png"] isEqual:button.currentBackgroundImage]) {
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [self setArray:button.tag :0];
    } else {
        [button setBackgroundImage:[UIImage imageNamed:@"BLUE.png"] forState:UIControlStateNormal];
        [self setArray:button.tag :1];
    }
    
    
}

-(void) initArray {
    NSMutableArray * mArr = [[NSMutableArray alloc] initWithCapacity:26];
    NSNumber * num;
    for ( int i = 0 ; i < 18 ; i ++ ) {
        num= [NSNumber numberWithInt:numbers[i]];
        [mArr addObject:num];
    }
    
    [mArr writeToFile:[self saveFilePath] atomically:YES];
    
    
}

-(void) setArray:(NSInteger)numID:(NSInteger)ina {
    numbers[numID]=ina;
}

-(void) loadArray {
     NSArray * arr= [NSArray arrayWithContentsOfFile:[self saveFilePath]];
    for ( int x = 0 ; x < 18 ; x ++ ) {
        numbers[x]=[[arr objectAtIndex:x] intValue];
        
    }
    
    [self setButton:numbers[0] :button_1];
    [self setButton:numbers[1] :button_2];
    [self setButton:numbers[2] :button_3];
    [self setButton:numbers[3] :button_4];
    [self setButton:numbers[4] :button_5];
    [self setButton:numbers[5] :button_6];
    [self setButton:numbers[6] :button_7];
    [self setButton:numbers[7] :button_8];
    [self setButton:numbers[8] :button_9];
    [self setButton:numbers[9] :button_10];
    [self setButton:numbers[10] :button_11];
    [self setButton:numbers[11] :button_12];
    [self setButton:numbers[12] :button_13];
    [self setButton:numbers[13] :button_14];
    [self setButton:numbers[14] :button_15];
    [self setButton:numbers[15] :button_16];
    [self setButton:numbers[16] :button_17];
    [self setButton:numbers[17] :button_18];

    
    
}
-(void) setButton:(NSInteger)a:(UIButton *)button {
    switch (a) {
        case 0:
            [button setBackgroundImage:nil forState:UIControlStateNormal];
            break;
        case 1:
            [button setBackgroundImage:[UIImage imageNamed:@"BLUE.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [button setBackgroundImage:[UIImage imageNamed:@"RED.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

-(NSString*) saveFilePath{
    NSString* path = [NSString stringWithFormat:@"%@%@",
                      [[NSBundle mainBundle] resourcePath],
                      @"myfilename.plist"];
    return path;
}



@end
