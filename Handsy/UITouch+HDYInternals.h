//
//  UITouch+HDYInternals.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITouch (HDYInternals)

- (id)initAtPoint:(CGPoint)point inWindow:(UIWindow *)window;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view;

- (void)setPhase:(UITouchPhase)phase;
- (void)setLocationInWindow:(CGPoint)location;

@end
