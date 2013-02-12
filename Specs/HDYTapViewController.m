//
//  HDYTapViewController.m
//  Handsy
//
//  Created by Ryan Davies on 12/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "HDYTapViewController.h"

@interface HDYTapViewController ()
@property (strong, nonatomic) NSMutableArray *locations;
@end

@implementation HDYTapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
}

- (void)tap:(UIGestureRecognizer *)tapGestureRecognizer
{
    if ([self locations] == nil) self.locations = [NSMutableArray array];
    CGPoint location = [tapGestureRecognizer locationInView:[self view]];
    [[self locations] addObject:[NSValue valueWithCGPoint:location]];
}

- (BOOL)receivedTapAtPosition:(CGPoint)position
{
    for (NSValue *value in [self locations]) {
        CGPoint stored = [value CGPointValue];
        if (CGPointEqualToPoint(position, stored)) {
            return YES;
        }
    }
    
    return NO;
}

@end
