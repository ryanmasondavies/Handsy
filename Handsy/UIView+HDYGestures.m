//
//  UIView+HDYGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIView+HDYGestures.h"
#import "HDYTapGesture.h"

@implementation UIView (HDYGestures)

- (void)tap
{
    [self tapAtPosition:[self center]];
}

- (void)tapAtPosition:(CGPoint)position
{
    HDYTapGesture *gesture = [[HDYTapGesture alloc] init];
    [gesture setPosition:position];
    [gesture performOnView:self];
}

@end
