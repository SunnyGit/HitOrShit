//
//  HSMovieDetailHeaderView.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailHeaderView.h"

#import <UIImageView+AFNetworking.h>

#import "HSMovieDetailHeaderViewData.h"


@interface HSMovieDetailHeaderView ()

@property (nonatomic, strong) UIImageView *moviePosterImageView;
@property (nonatomic, strong) UILabel *movieNameLabel;
@property (nonatomic, strong) UILabel *castTitleLabel;
@property (nonatomic, strong) UILabel *castDetailsLabel;
@property (nonatomic, strong) UIView *reviewDetailsView;

@end

@implementation HSMovieDetailHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

#pragma mark setup methods

- (void)setupSubViews {
    [self setupMoviePosterImageView];
    [self setupMovieNameLabel];
    [self setupCastTitleLabel];
    [self setupCastDetailsLabel];
    [self setupReviewDetailView];
}

- (void)setupMoviePosterImageView {
    self.moviePosterImageView = [[UIImageView alloc] init];
    self.moviePosterImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.moviePosterImageView];
    [self setupMoviePosterImageViewConstraints];
}

- (void)setupMovieNameLabel {
    self.movieNameLabel = [[UILabel alloc] init];
    self.movieNameLabel.backgroundColor = [UIColor clearColor];
    self.movieNameLabel.textColor = [UIColor whiteColor];
    self.movieNameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
    [self addSubview:self.movieNameLabel];
    [self setupMovieNameLabelConstraints];
}

- (void)setupCastTitleLabel {
    self.castTitleLabel = [[UILabel alloc] init];
    self.castTitleLabel.backgroundColor = [UIColor clearColor];
    self.castTitleLabel.text = NSLocalizedString(@"Cast & Crew", @"");
    self.castTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14.0f];
    self.castTitleLabel.textColor = [UIColor colorWithRed:243.0/255.0
                                                    green:170.0/255.0
                                                     blue:0.0/255.0
                                                    alpha:1.0f];
    [self addSubview:self.castTitleLabel];
}

- (void)setupCastDetailsLabel {
    
}

- (void)setupReviewDetailView {
    
}

#pragma mark Setter Methods

- (void)setHeaderData:(HSMovieDetailHeaderViewData *)headerData {
    _headerData = headerData;
    self.movieNameLabel.text = headerData.movieName;
    [self.moviePosterImageView setImageWithURL:[NSURL URLWithString:headerData.moviePostUrl]];
}

#pragma mark Constraint methods setup

- (void)setupMoviePosterImageViewConstraints {
    self.moviePosterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_moviePosterImageView(==height)]"
                                                                 options:0
                                                                 metrics:@{@"height": @(300.0)}
                                                                   views:NSDictionaryOfVariableBindings(_moviePosterImageView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_moviePosterImageView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_moviePosterImageView)]];
}

- (void)setupMovieNameLabelConstraints {
    self.movieNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_movieNameLabel]-15-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_movieNameLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieNameLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.moviePosterImageView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:-15.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieNameLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0
                                                      constant:60.0f]];
}

@end
