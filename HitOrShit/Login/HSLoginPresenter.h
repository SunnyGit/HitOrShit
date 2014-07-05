//
//  HSLoginPresenter.h
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSWireframe.h"
#import "HSLoginViewController.h"

@protocol HSLoginInteractorInteraction;

@interface HSLoginPresenter : NSObject

@property (nonatomic, weak) HSWireframe *wireframe;
@property (nonatomic, weak) HSLoginViewController *viewController;
@property (nonatomic, strong) id<HSLoginInteractorInteraction> interactor;

- (void)loginWithFacebook;

@end
