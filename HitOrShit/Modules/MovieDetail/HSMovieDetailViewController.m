//
//  HSMovieDetailViewController.m
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailViewController.h"

#import "HSMovieListData.h"
#import "UIImageView+AFNetworking.h"

@interface HSMovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *movieBannerImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (strong, nonatomic) UIButton *backButton;
@end

@implementation HSMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self setupBackButton];
    [self setupData];
}

#pragma mark Setup Methods

- (void)setupBackButton {
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setTitle:@"<-" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    [self addConstraintsToBackButton];
}

- (void)setupData {
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:self.movieData.moviePosterLink]];
}

#pragma Actions

- (void)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma Constraints

- (void)addConstraintsToBackButton {
    self.backButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0 constant:10.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0 constant:20.0]];
    
//    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
//                                                                          attribute:NSLayoutAttributeRight
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.contentContainerView
//                                                                          attribute:NSLayoutAttributeRight
//                                                                         multiplier:1.0 constant:0.0]];
//    
//    
//    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
//                                                                          attribute:NSLayoutAttributeBottom
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.contentContainerView
//                                                                          attribute:NSLayoutAttributeBottom
//                                                                         multiplier:1.0 constant:-60.0]];
}

@end
