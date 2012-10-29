//
//  UIEvent+HDYTouch.m
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "UIEvent+HDYTouch.h"

// GSEvent is an undeclared object. We don't need to use it ourselves but some
// Apple APIs (UIScrollView in particular) require the x and y fields to be present.
typedef struct __GSEvent * GSEventRef;

@interface HDYEventProxy : NSObject
{
@public
	unsigned int flags;
	unsigned int type;
	unsigned int ignored1;
	float x1;
	float y1;
	float x2;
	float y2;
	unsigned int ignored2[10];
	unsigned int ignored3[7];
	float sizeX;
	float sizeY;
	float x3;
	float y3;
	unsigned int ignored4[3];
}

@end

@implementation HDYEventProxy
@end

@interface UIEvent ()
- (void)_addTouch:(id)arg1 forDelayedDelivery:(BOOL)arg2;
- (void)_clearTouches;
- (void)_setGSEvent:(GSEventRef)event;
@end

@implementation UIEvent (HDYTouch)

+ (UIEvent *)eventWithTouch:(UITouch *)touch
{
    UIEvent *event = [[UIApplication sharedApplication] performSelector:@selector(_touchesEvent)];
    
    CGPoint location = [touch locationInView:touch.window];
    HDYEventProxy *eventProxy = [[HDYEventProxy alloc] init];
    eventProxy->x1 = location.x;
    eventProxy->y1 = location.y;
    eventProxy->x2 = location.x;
    eventProxy->y2 = location.y;
    eventProxy->x3 = location.x;
    eventProxy->y3 = location.y;
    eventProxy->sizeX = 1.0;
    eventProxy->sizeY = 1.0;
    eventProxy->flags = ([touch phase] == UITouchPhaseEnded) ? 0x1010180 : 0x3010180;
    eventProxy->type = 3001;
    
    [event _clearTouches];
    [event _setGSEvent:(struct __GSEvent *)eventProxy];
    [event _addTouch:touch forDelayedDelivery:NO];
    
    return event;
}

@end
