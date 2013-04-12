// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
