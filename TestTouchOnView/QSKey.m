//
//  QSKey.m
//  TestTouchOnView
//
//  Created by Quy Sang Le on 2/19/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "QSKey.h"

@implementation QSKey
@synthesize label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)awakeFromNib{
    NSLog(@"awakeFromNib");
}


@end
