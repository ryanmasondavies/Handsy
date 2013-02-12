//
//  HDYViewGesturesSpec.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

SpecBegin(HDYViewGestures)

__block HDYTapViewController *tapViewController;

before(^{
    tapViewController = [[HDYTapViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:tapViewController];
});

describe(@"-tap", ^{
    it(@"performs a tap in the center of the view", ^{
        [[tapViewController view] tap];
        BOOL received = [tapViewController receivedTapAtPosition:[[tapViewController view] center]];
        [[@(received) should] beTrue];
    });
});

describe(@"-tapAtPosition:", ^{
    it(@"performs a tap at the specified location", ^{
        [[tapViewController view] tapAtPosition:CGPointMake(32, 32)];
        BOOL received = [tapViewController receivedTapAtPosition:CGPointMake(32, 32)];
        [[@(received) should] beTrue];
    });
});

SpecEnd
