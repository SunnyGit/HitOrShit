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

#import "HSMovieDetailViewController.h"
#import "HSMovieDetailPresenter.h"
#import "HSMovieDetailInteractor.h"

#import "HSLoginViewController.h"
#import "HSLoginPresenter.h"
#import "HSLoginInteractor.h"

#import "HOSRegister.h"
#import "HOSFBDetails.h"

@interface HSWireframe () <HSAuthorisationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) HSAuthorisation *authorisation;

@property (nonatomic, strong) HSMoviesListViewController *listViewController;
@property (nonatomic, strong) HSMovieDetailViewController *movieDetailController;

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
    HSMoviesListInteractor *interactor = [[HSMoviesListInteractor alloc] init];
    HSMoviesListPresenter *presenter = [[HSMoviesListPresenter alloc] init];
    self.listViewController.presenter = presenter;
    presenter.viewController = self.listViewController;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    presenter.wireframe = self;
    return self.listViewController;
}


- (void)pushMovieDetailViewControllerWithMovieListData:(HSMovieListData *)data{
    if (self.movieDetailController != nil) {
        self.movieDetailController.movieData = data;
        [self.listViewController.navigationController pushViewController:self.movieDetailController animated:YES];
        return;
    }
    self.movieDetailController = [self.storyboard instantiateViewControllerWithIdentifier:@"HSMovieDetailViewController"];
    self.movieDetailController.movieData = data;
    HSMovieDetailInteractor *interactor = [[HSMovieDetailInteractor alloc] init];
    HSMovieDetailPresenter *presenter = [[HSMovieDetailPresenter alloc] init];
    self.movieDetailController.presenter = presenter;
    presenter.interactor = interactor;
    presenter.wireFrame = self;
    [self.listViewController.navigationController pushViewController:self.movieDetailController animated:YES];
}

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

- (void)registerForHitOrShitWithResultBlock:(void(^)(NSArray *records))resultBlock
                               failureBlock:(void(^)(NSError *error))failureBlock {
    HOSFBDetails *fbdetails = [HOSFBDetails MR_findFirst];
    NSDictionary *data = nil;
    NSString *fbImageUrl = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=",fbdetails.userid];
    if (fbdetails != nil) {
        data = @{@"user_id": fbdetails.userid,
                 @"name": fbdetails.name,
                 @"user_image":fbImageUrl};
    }
    [HOSRegister registerNewUserWithData:data
                             resultBlock:^(NSArray *records) {
                                 if (resultBlock) {
                                     resultBlock(records);
                                 }
                             } failureBlock:^(NSError *error) {
                                 if (failureBlock) {
                                     failureBlock(error);
                                 }
                             }];
}

- (void)userLoggedIn {
    
    [self registerForHitOrShitWithResultBlock:^(NSArray *records) {
        [self dismissLoginScreen];
        
    } failureBlock:^(NSError *error) {
        [self dismissLoginScreen];

    }];
}

- (void)showMessage:(NSString *)text withTitle:(NSString *)title {
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

@end
