//
//  contact.h
//  iShift
//
//  Created by Andy Sheng on 12-10-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contact : UIViewController {
    UIScrollView *scroll;
    NSMutableArray * buncArr;
    UITextField * defName, * defCon;
    CGRect defaultLocation;

}


@property (nonatomic, retain) IBOutlet UIScrollView * scroll;
@property (nonatomic, retain) NSMutableArray * buncArr;
@property CGRect defaultLocation;


@end
