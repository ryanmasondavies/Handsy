//
//  UIEvent+HDYTouch.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEvent (HDYTouch)

+ (UIEvent *)eventWithTouch:(UITouch *)touch;

@end
