//
//  UIView+HDYGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIView+HDYGestures.h"
#import "HDYTapGesture.h"

@interface UIView (HDYGesturesPrivate)
+ (NSMutableDictionary *)registeredGestureClasses;
@end

@implementation UIView (HDYGestures)

+ (void)initialize
{
    [self registerClass:[HDYTapGesture class] forGesturesOfType:HDYTapGestureType];
}

+ (NSMutableDictionary *)registeredGestureClasses
{
    static dispatch_once_t pred;
    static NSMutableDictionary *dictionary = nil;
    dispatch_once(&pred, ^{ dictionary = [NSMutableDictionary dictionary]; });
    return dictionary;
}

+ (void)registerClass:(Class)gestureClass forGesturesOfType:(HDYGestureType)type
{
    [[self registeredGestureClasses] setObject:gestureClass forKey:@(type)];
}

+ (Class)registeredClassForGesturesOfType:(HDYGestureType)type
{
    return [[self registeredGestureClasses] objectForKey:@(type)];
}

- (void)tap
{
    Class tapGestureClass = [[self class] registeredClassForGesturesOfType:HDYTapGestureType];
    HDYTapGesture *gesture = [[tapGestureClass alloc] init];
    [gesture performOnView:self];
}

@end
