//
//  HDYTapGesture.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "HDYTapGesture.h"
#import "UITouch+HDYInternals.h"
#import "UIEvent+HDYTouch.h"

@implementation HDYTapGesture

- (void)performOnView:(UIView *)view
{
    UITouch *touch = [[UITouch alloc] initAtPoint:[self position] inView:view];
    [touch setPhase:UITouchPhaseBegan];
    
    UIEvent *event = [UIEvent eventWithTouch:touch];
    [[UIApplication sharedApplication] sendEvent:event];
    
    [touch setPhase:UITouchPhaseEnded];
    [[UIApplication sharedApplication] sendEvent:event];
    
    // Dispatching the event doesn't actually update the first responder, so fake it:
    if ([touch.view isDescendantOfView:view] && [view canBecomeFirstResponder])
        [view becomeFirstResponder];
}

@end
