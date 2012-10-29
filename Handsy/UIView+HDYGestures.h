//
//  UIView+HDYGestures.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const HDYTapGestureClassIdentifier;

@interface UIView (HDYGestures)

+ (void)registerGestureClass:(Class)gestureClass forIdentifier:(NSString *)identifier;
- (void)tap;

@end
