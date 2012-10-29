//
//  UIView+HDYGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIView+HDYGestures.h"
#import "UIView+HDYGestureFactory.h"
#import "HDYGestureFactory.h"
#import "HDYTapGesture.h"

@implementation UIView (HDYGestures)

- (void)tap
{
    HDYTapGesture *gesture = [[[self class] gestureFactory] tapGesture];
    [gesture setPosition:[self center]];
    [gesture performOnView:self];
}

- (void)tapAtPosition:(CGPoint)position
{
    HDYTapGesture *gesture = [[[self class] gestureFactory] tapGesture];
    [gesture setPosition:position];
    [gesture performOnView:self];
}

@end
