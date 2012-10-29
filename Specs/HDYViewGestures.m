//
//  HDYViewGestures.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "HDYSpecHelper.h"
#import "UIView+HDYGestures.h"
#import "UIView+HDYGestureFactory.h"
#import "HDYGestureFactory.h"
#import "HDYTapGesture.h"

SpecBegin(HDYViewGestures)

__block UIView *view;
__block id gesture;

before(^{
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    
    // Create a gesture that we can make expectations on:
    gesture = [OCMockObject partialMockForObject:[[HDYTapGesture alloc] init]];
    
    // Swap out the gesture factory:
    id gestureFactory = [OCMockObject mockForClass:[HDYGestureFactory class]];
    [[[gestureFactory stub] andReturn:gesture] tapGesture];
    [UIView setGestureFactory:gestureFactory];
});

describe(@"-tap", ^{
    it(@"should take place in the center of the view", ^{
        [view tap];
        expect([gesture position]).to.equal(CGPointMake(32, 32));
    });
    
    it(@"should perform a tap gesture", ^{
        [[gesture expect] performOnView:view];
        [view tap];
        [gesture verify];
    });
});

describe(@"-tapAtPosition:", ^{
    it(@"should take place at the specified position", ^{
        [view tapAtPosition:CGPointMake(16, 16)];
        expect([gesture position]).to.equal(CGPointMake(16, 16));
    });
    
    it(@"should perform a tap gesture", ^{
        [[gesture expect] performOnView:view];
        [view tapAtPosition:CGPointMake(16, 16)];
        [gesture verify];
    });
});

SpecEnd
