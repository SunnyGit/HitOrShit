//
//  HSMovieDetailViewPresenter.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSMovieDetailInteractor.h"

@class HSWireframe;

@interface HSMovieDetailPresenter : NSObject

@property (nonatomic, strong) id<HSMovieDetailInteractorInterface> interactor;

@property (nonatomic, strong) HSWireframe *wireFrame;

- (void)fetchMovieReviewDataForMovieId:(NSString *)movieId
                           withSuccess:(void(^)(NSArray *movieReviewData))completion
                        andWithFailure:(void(^)(NSError *error, NSArray *localReviewData))failure;

@end
