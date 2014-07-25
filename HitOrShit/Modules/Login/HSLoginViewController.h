//
//  HSLoginViewController.h
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GAI.h"

@class HSLoginPresenter;

@interface HSLoginViewController : GAITrackedViewController

@property (strong, nonatomic) HSLoginPresenter *presenter;

@end
