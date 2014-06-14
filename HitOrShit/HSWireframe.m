//
//  HSWireframe.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSWireframe.h"

#import "HSMoviesListTableViewController.h"
#import "HSMoviesListPresenter.h"
#import "HSMoviesListInteractor.h"

@interface HSWireframe ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) UINavigationController *moviesListNavigationController;

@end

@implementation HSWireframe

- (instancetype)initWithWindow:(UIWindow*)window {
    self = [super init];
    if (self) {
        _window = window;
        _storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        _window.rootViewController = [self moviesListNavigationController];
    }
    return self;
}

- (UINavigationController *)moviesListNavigationController {
    if (_moviesListNavigationController == nil) {
        _moviesListNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"HSNavigationController"];
        HSMoviesListTableViewController *moviesListViewController = (HSMoviesListTableViewController *)[_moviesListNavigationController topViewController];
        HSMoviesListInteractor *interactor = [[HSMoviesListInteractor alloc] init];
        HSMoviesListPresenter *presenter = [[HSMoviesListPresenter alloc] init];
        moviesListViewController.presenter = presenter;
        presenter.viewController = moviesListViewController;
        presenter.interactor = interactor;
        interactor.presenter = presenter;
        presenter.wireframe = self;
    }
    return _moviesListNavigationController;
}

@end
