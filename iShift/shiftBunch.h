//
//  shiftBunch.h
//  iShift
//
//  Created by Andy Sheng on 12-10-25.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shiftBunch : NSObject {
    UISegmentedControl * seg;
    UITextField * txtf_1;
    UITextField * txtf_2;
    NSArray * arr;
    
}

@property (nonatomic, retain) UISegmentedControl * seg;
@property (nonatomic, retain) UITextField * txtf_1;
@property (nonatomic, retain) UITextField * txtf_2;
@property (nonatomic, retain) NSArray * arr;
-(NSArray *)getArray;
-(id) initWithBoundsAndArray:(CGRect)bounds:(int)segSel:(NSString *)txt1:(NSString *)txt2;

@end
