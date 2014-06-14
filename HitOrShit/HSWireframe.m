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
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) UINavigationController *moviesListNavigationController;

@end

@implementation HSWireframe

- (instancetype)initWithWindow:(UIWindow*)window {
    self = [super init];
    if (self) {
        _window = window;
    }
    return self;
}

@end
