//
//  UIView+HDYGestureFactory.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIView+HDYGestureFactory.h"
#import "HDYGestureFactory.h"

static HDYGestureFactory *gestureFactory = nil;

@implementation UIView (HDYGestureFactory)

+ (void)setGestureFactory:(HDYGestureFactory *)factory
{
    gestureFactory = factory;
}

+ (HDYGestureFactory *)gestureFactory
{
    if (gestureFactory == nil)
        [self setGestureFactory:[HDYGestureFactory new]];
    
    return gestureFactory;
}

@end
