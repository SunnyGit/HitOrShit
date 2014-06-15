//
//  HSMoviesListInteractor.h
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSMoviesListPresenter.h"

@protocol HSMoviesListInteractorInteraction <NSObject>

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure;

@end

@interface HSMoviesListInteractor : NSObject<HSMoviesListInteractorInteraction>

@property (nonatomic, strong) HSMoviesListPresenter *presenter;

@end
