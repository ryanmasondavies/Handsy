//
//  UIView+HDYGestures.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    HDYTapGestureType = 0,
};
typedef NSInteger HDYGestureType;

@interface UIView (HDYGestures)

+ (void)registerClass:(Class)gestureClass forGesturesOfType:(HDYGestureType)type;
+ (Class)registeredClassForGesturesOfType:(HDYGestureType)type;

- (void)tap;

@end
