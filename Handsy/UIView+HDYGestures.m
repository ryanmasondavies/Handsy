//
//  UIView+HDYGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIView+HDYGestures.h"
#import "HDYTapGesture.h"

NSString * const HDYTapGestureClassIdentifier = @"TapGestureClass";

@interface UIView (HDYGesturesPrivate)
+ (NSMutableDictionary *)registeredGestureClasses;
@end

@implementation UIView (HDYGestures)

+ (void)initialize
{
    [self registerGestureClass:[HDYTapGesture class] forIdentifier:HDYTapGestureClassIdentifier];
}

+ (NSMutableDictionary *)registeredGestureClasses
{
    static dispatch_once_t pred;
    static NSMutableDictionary *dictionary = nil;
    dispatch_once(&pred, ^{ dictionary = [NSMutableDictionary dictionary]; });
    return dictionary;
}

+ (void)registerGestureClass:(Class)gestureClass forIdentifier:(NSString *)identifier
{
    [[self registeredGestureClasses] setObject:gestureClass forKey:identifier];
}

- (void)tap
{
    Class tapGestureClass = [[[self class] registeredGestureClasses] objectForKey:HDYTapGestureClassIdentifier];
    HDYTapGesture *gesture = [[tapGestureClass alloc] init];
    [gesture performOnView:self];
}

@end
