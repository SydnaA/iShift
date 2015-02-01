//
//  contact.m
//  iShift
//
//  Created by Andy Sheng on 12-10-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "contact.h"
#import "shiftBunch.h"

@implementation contact
@synthesize scroll, buncArr, defaultLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    defaultLocation=CGRectMake(20, 15, 200, 44);
    buncArr = [[NSMutableArray alloc] init];
    [scroll alwaysBounceVertical];
    [self initArray];
    [self loadArray];
}
-(void)initButtonMut {
    [buncArr addObject:[[shiftBunch alloc] initWithBoundsAndArray:defaultLocation:0:nil:nil]];
    [scroll addSubview:[buncArr lastObject]];
}

-(IBAction)addBunch {
    //[self initButtonMut];
}


-(void)deleteBut {
    [buncArr removeLastObject];
}
//55
-(void) loadArray {
    NSArray * arry= [NSArray arrayWithContentsOfFile:[self saveFilePath]];
    if ([arry count]==0) {
        return;
    }
    for ( int x = 0; x < [arry count]-3 ; x+=3 ) {
        defaultLocation.origin.y=defaultLocation.origin.y+((x/3)*55);
        [buncArr addObject:[[shiftBunch alloc] initWithBoundsAndArray:defaultLocation:[[arry objectAtIndex:x] intValue]:[arry objectAtIndex:x+1]:[arry objectAtIndex:x+2]]];
    }
}

-(void) initArray {
    NSMutableArray * mArr = [[NSMutableArray alloc] init];
    for(int x = 0; x<[buncArr count]; x++) {
        [mArr addObjectsFromArray:[[buncArr objectAtIndex:x] getArray]];
    }
    [mArr writeToFile:[self saveFilePath] atomically:YES];
}
-(NSString*) saveFilePath{
    NSString* path = [NSString stringWithFormat:@"%@%@",
                      [[NSBundle mainBundle] resourcePath],
                      @"signIn.plist"];
    return path;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}
@end
