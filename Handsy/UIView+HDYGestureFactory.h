//
//  UIView+HDYGestureFactory.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HDYGestureFactory;

@interface UIView (HDYGestureFactory)

+ (void)setGestureFactory:(HDYGestureFactory *)factory;
+ (HDYGestureFactory *)gestureFactory;

@end
