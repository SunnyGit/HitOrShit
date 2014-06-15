//
//  HSWireframe.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSWireframe.h"

#import "HSMoviesListViewController.h"
#import "HSMoviesListPresenter.h"
#import "HSMoviesListInteractor.h"

@interface HSWireframe ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) HSMoviesListViewController *listViewController;

@end

@implementation HSWireframe

- (instancetype)initWithWindow:(UIWindow*)window {
    self = [super init];
    if (self) {
        _window = window;
        [self configureListViewController];
    }
    return self;
}

#pragma mark Configure Methods

- (void)configureListViewController {
    self.listViewController = [self obtainListViewControllerInstance];
    if (self.listViewController != nil) {
        HSMoviesListInteractor *interactor = [[HSMoviesListInteractor alloc] init];
        HSMoviesListPresenter *presenter = [[HSMoviesListPresenter alloc] init];
        self.listViewController.presenter = presenter;
        presenter.viewController = self.listViewController;
        presenter.interactor = interactor;
        interactor.presenter = presenter;
        presenter.wireframe = self;
    }
}

- (HSMoviesListViewController *)obtainListViewControllerInstance {
    if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
        if ([[navController viewControllers] count] > 0) {
            return (HSMoviesListViewController *)[navController.viewControllers objectAtIndex:0];
        }
    }
    return nil;
}

@end
