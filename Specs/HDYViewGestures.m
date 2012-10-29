//
//  HDYViewGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "HDYSpecHelper.h"
#import "UIView+HDYGestures.h"
#import "HDYTapGesture.h"

@interface HDYMockGesture : NSObject
+ (id)sharedGesture;
@end

@implementation HDYMockGesture

+ (id)sharedGesture
{
    static dispatch_once_t pred;
    static HDYMockGesture *gesture = nil;
    dispatch_once(&pred, ^{ gesture = [OCMockObject niceMockForClass:[HDYTapGesture class]]; });
    return gesture;
}

+ (id)alloc
{
    return [self sharedGesture];
}

@end

SpecBegin(HDYViewGestures)

beforeAll(^{
    [UIView registerClass:[HDYMockGesture class] forGesturesOfType:HDYTapGestureType];
});

describe(@"-tap", ^{
    __block UIView *view;
    __block id mock;
    
    before(^{
        view = [[UIView alloc] init];
        mock = [HDYMockGesture sharedGesture];
    });
    
    it(@"should invoke -performOnView: on a new tap gesture", ^{
        [[mock expect] performOnView:view];
        [view tap];
        [mock verify];
    });
});

SpecEnd
