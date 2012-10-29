//
//  HDYTestViewController.h
//  Handsy
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDYTestViewController : UIViewController
@property (nonatomic, getter = hasReceivedAction) BOOL receivedAction;

- (void)action:(id)sender;

@end
