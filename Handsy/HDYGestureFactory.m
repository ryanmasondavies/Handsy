//
//  HDYGestureFactory.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "HDYGestureFactory.h"
#import "HDYTapGesture.h"

@implementation HDYGestureFactory

- (id)tapGesture
{
    return [[HDYTapGesture alloc] init];
}

@end
