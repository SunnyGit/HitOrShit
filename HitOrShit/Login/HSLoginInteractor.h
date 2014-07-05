//
//  HSLoginInteractor.h
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSLoginPresenter.h"

@protocol HSLoginInteractorInteraction <NSObject>

@end

@interface HSLoginInteractor : NSObject <HSLoginInteractorInteraction>

@property (nonatomic, strong) HSLoginPresenter *presenter;

@end
