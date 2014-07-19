//
//  HSMoviesListCell.m
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMoviesListCell.h"

#import "HSMovieListData.h"
#import "HSMovieStarRatingView.h"
#import "UIImageView+AFNetworking.h"
#import "UIFont+HSFont.h"

@interface HSMoviesListCell ()

@property (nonatomic, strong) UIImageView *movieBannerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UIView *contentContainerView;
@property (nonatomic, strong) HSMovieStarRatingView *ratingView;

@end

@implementation HSMoviesListCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        [self setupConstraints];
    }
    return self;
}

#pragma mark Setup Methods

- (void)setupSubViews {
    [self setupContainerView];
    [self setupTitleLabel];
    [self setupTypeLabel];
    [self setupBannerImagaeView];
    [self setupRatingView];
}

- (void)setupContainerView {
    self.contentContainerView = [[UIView alloc] init];
    self.contentContainerView.backgroundColor = [UIColor colorWithWhite:1.0f
                                                                  alpha:1.0f];
    self.contentContainerView.layer.masksToBounds = NO;
    self.contentContainerView.layer.shadowColor = [[UIColor colorWithWhite:0.2 alpha:0.6] CGColor];
    self.contentContainerView.layer.shadowRadius = 0.5;
    self.contentContainerView.layer.shadowOpacity = 0.5;
    self.contentContainerView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    self.contentContainerView.layer.cornerRadius = 2.0;
    [self addSubview:self.contentContainerView];
}

- (void)setupBannerImagaeView {
    self.movieBannerImageView = [[UIImageView alloc] init];
    [self.movieBannerImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.movieBannerImageView setClipsToBounds:YES];
    self.movieBannerImageView.backgroundColor = [UIColor clearColor];
    [self.contentContainerView addSubview:self.movieBannerImageView];
}

- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = NSLocalizedString(@"Sample Movie Name", @"");
    self.titleLabel.font = [UIFont regularApplicationFontWithSize:14.0f];
    self.titleLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    self.titleLabel.numberOfLines = 2;
    [self.contentContainerView addSubview:self.titleLabel];
}

- (void)setupTypeLabel {
    self.typeLabel = [[UILabel alloc] init];
    self.typeLabel.text = NSLocalizedString(@"Sample Movie Name", @"");
    self.typeLabel.font = [UIFont regularApplicationFontWithSize:12.0f];
    self.typeLabel.textColor = [UIColor colorWithWhite:85.0/255.0 alpha:1.0];
    self.typeLabel.numberOfLines = 1;
    [self.contentContainerView addSubview:self.typeLabel];
}

- (void)setupRatingView {
    self.ratingView = [[HSMovieStarRatingView alloc] init];
    self.ratingView.canEdit = NO;
    self.ratingView.maxRating = 5;
    [self.contentContainerView addSubview:self.ratingView];
}

#pragma mark Constraint Methods

- (void)setupConstraints {
    [self setupContainerViewConstraints];
    [self setupBannerImagaeViewConstraints];
    [self setupTitleLabelConstraints];
    [self setupRatingViewConstraints];
    [self setupTypeLabelConstraints];
}

- (void)setupContainerViewConstraints {
    self.contentContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0 constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0 constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0 constant:0.0f]];
}

- (void)setupBannerImagaeViewConstraints {
    self.movieBannerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0 constant:0.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0 constant:0.0]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:0.0]];
    
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0 constant:-60.0]];
}

- (void)setupTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:5.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                          attribute:NSLayoutAttributeTrailing
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.movieBannerImageView
                                                                          attribute:NSLayoutAttributeTrailing
                                                                         multiplier:1.0
                                                                           constant:-5.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:5.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:30.0f]];
}

- (void)setupRatingViewConstraints {
    self.ratingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.ratingView
                                                                          attribute:NSLayoutAttributeTrailing
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.movieBannerImageView
                                                                          attribute:NSLayoutAttributeTrailing
                                                                         multiplier:1.0
                                                                           constant:4.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.ratingView
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:0.0
                                                                           constant:75.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.ratingView
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:0.0
                                                                           constant:15.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.ratingView
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.contentContainerView
                                                                          attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0
                                                                           constant:-5.0f]];
}

- (void)setupTypeLabelConstraints {
    self.typeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.typeLabel
                                                                          attribute:NSLayoutAttributeLeading
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.movieBannerImageView
                                                                          attribute:NSLayoutAttributeLeading
                                                                         multiplier:1.0
                                                                           constant:5.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.typeLabel
                                                                          attribute:NSLayoutAttributeTrailing
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.ratingView
                                                                          attribute:NSLayoutAttributeTrailing
                                                                         multiplier:1.0
                                                                           constant:-1.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.typeLabel
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.contentContainerView
                                                                          attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0
                                                                           constant:-7.0f]];
}

#pragma mark Setter Methods

- (void)setMovieListData:(HSMovieListData *)movieListData {
    _movieListData = movieListData;
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:movieListData.moviePosterLink]];
    self.titleLabel.text = movieListData.movieName;
    self.typeLabel.text = movieListData.movieGenre;
    self.ratingView.rating = 3.5;
}

@end
