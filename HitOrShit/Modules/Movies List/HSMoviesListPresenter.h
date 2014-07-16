//
//  HSMoviesListPresenter.h
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSWireframe.h"
#import "HSMoviesListViewController.h"
#import "HSMoviesListInteractor.h"

@protocol HSMoviesListInteractorInteraction;

@interface HSMoviesListPresenter : NSObject

@property (nonatomic, weak) HSWireframe *wireframe;
@property (nonatomic, weak) HSMoviesListViewController *viewController;
@property (nonatomic, strong) id<HSMoviesListInteractorInteraction> interactor;

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure;

@end
