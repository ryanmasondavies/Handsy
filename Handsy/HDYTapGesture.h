//
//  HDYTapGesture.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDYTapGesture : NSObject
@property (nonatomic) CGPoint position;

- (void)performOnView:(UIView *)view;

@end
