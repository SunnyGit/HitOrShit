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

@end

@implementation HSMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self setupData];
}

#pragma mark Setup Methods

- (void)setupData {
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:self.movieData.moviePosterLink]];
}

@end
