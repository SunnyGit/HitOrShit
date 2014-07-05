//
//  HSWireframe.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSWireframe.h"

#import "HSAuthorisation.h"

#import "HSMoviesListViewController.h"
#import "HSMoviesListPresenter.h"
#import "HSMoviesListInteractor.h"

#import "HSLoginViewController.h"
#import "HSLoginPresenter.h"
#import "HSLoginInteractor.h"

@interface HSWireframe () <HSAuthorisationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) HSAuthorisation *authorisation;
@property (nonatomic, strong) HSMoviesListViewController *listViewController;
@property (nonatomic, strong) HSLoginViewController *loginViewController;

@end

@implementation HSWireframe

- (instancetype)initWithWindow:(UIWindow*)window {
    self = [super init];
    if (self) {
        _window = window;
        _authorisation = [[HSAuthorisation alloc] init];
        _authorisation.delegate = self;
        _storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]];
        [self configureListViewController];
    }
    return self;
}

#pragma mark Configure Methods

- (HSMoviesListViewController *)configureListViewController {
    UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"HSNavigationController"];
    self.window.rootViewController = navController;
    self.listViewController = (HSMoviesListViewController *)[navController topViewController];
//    self.listViewController = [self obtainListViewControllerInstance];
    HSMoviesListInteractor *interactor = [[HSMoviesListInteractor alloc] init];
    HSMoviesListPresenter *presenter = [[HSMoviesListPresenter alloc] init];
    self.listViewController.presenter = presenter;
    presenter.viewController = self.listViewController;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    presenter.wireframe = self;
    return self.listViewController;
}

//- (HSMoviesListViewController *)obtainListViewControllerInstance {
//    return [self.storyboard instantiateViewControllerWithIdentifier:@"HSMoviesListViewController"];
//}

- (void)showLoginScreenWithAnimation:(BOOL)animate {
    self.loginViewController = [self loginViewController];
    [self.window.rootViewController presentViewController:self.loginViewController
                                                 animated:animate
                                               completion:nil];
}

- (HSLoginViewController *)loginViewController {
    HSLoginPresenter *presenter = [[HSLoginPresenter alloc] init];
    HSLoginInteractor *interactor = [[HSLoginInteractor alloc] init];
    HSLoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HSLoginViewController"];
    loginVC.presenter = presenter;
    presenter.viewController = loginVC;
    presenter.interactor = interactor;
    presenter.wireframe = self;
    return loginVC;
}

- (void)loginWithFacebook {
    [self.authorisation loginWithFacebook];
}

- (void)dismissLoginScreen {
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userLoggedOut {
    [self showLoginScreenWithAnimation:YES];
}

- (void)userLoggedIn {
    [self dismissLoginScreen];
}

- (void)showMessage:(NSString *)text withTitle:(NSString *)title {
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

@end
