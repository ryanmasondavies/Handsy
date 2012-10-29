//
//  HDYTapGestureSpec.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "HDYSpecHelper.h"
#import "HDYTestViewController.h"
#import "HDYTapGesture.h"

SpecBegin(HDYTapGesture)

describe(@"A tap gesture", ^{
    it(@"should fire a button's touch up inside action", ^{
        HDYTestViewController *viewController = [[HDYTestViewController alloc] init];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:CGRectMake(16, 16, 64, 64)];
        [button addTarget:viewController action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [[viewController view] addSubview:button];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        
        HDYTapGesture *tapGesture = [[HDYTapGesture alloc] init];
        [tapGesture setPosition:[button center]];
        [tapGesture performOnView:button];
        
        expect([viewController hasReceivedAction]).to.beTruthy();
    });
    
    it(@"should invoke a bar button item's action", ^{
        HDYTestViewController *viewController = [[HDYTestViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:viewController action:@selector(action:)];
        [[viewController navigationItem] setLeftBarButtonItem:addButton];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:navigationController];
        
        HDYTapGesture *tapGesture = [[HDYTapGesture alloc] init];
        [tapGesture setPosition:CGPointMake(22, 22)];
        [tapGesture performOnView:[navigationController navigationBar]];
        
        expect([viewController hasReceivedAction]).to.beTruthy();
    });
});

SpecEnd
