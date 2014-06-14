//
//  HSMoviesListPresenter.h
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSWireframe.h"
#import "HSMoviesListTableViewController.h"
#import "HSMoviesListInteractor.h"

@interface HSMoviesListPresenter : NSObject

@property (nonatomic, weak) HSWireframe *wireframe;
@property (nonatomic, weak) HSMoviesListTableViewController *viewController;
@property (nonatomic, strong) id<HSMoviesListInteractorInteraction> interactor;

@end
