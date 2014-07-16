//
//  HSMoviesListCell.m
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMoviesListCell.h"

#import "HSMovieListData.h"
#import "UIImageView+AFNetworking.h"

@interface HSMoviesListCell ()

@property (nonatomic, strong) UIImageView *movieBannerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *contentContainerView;

@end

@implementation HSMoviesListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
        [self setupConstraints];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark Setup Methods

- (void)setupSubViews {
    [self setupContainerView];
    [self setupTitleLabel];

    [self setupBannerImagaeView];
}

- (void)setupContainerView {
    self.contentContainerView = [[UIView alloc] init];
    self.contentContainerView.backgroundColor = [UIColor colorWithWhite:240.0f
                                                                  alpha:1.0f];
    self.contentContainerView.layer.masksToBounds = NO;
    self.contentContainerView.layer.cornerRadius = 3;
    self.contentContainerView.layer.shadowRadius = 2;
    self.contentContainerView.layer.shadowOpacity = 0.5;
    [self addSubview:self.contentContainerView];
}

- (void)setupBannerImagaeView {
    self.movieBannerImageView = [[UIImageView alloc] init];
    self.movieBannerImageView.backgroundColor = [UIColor clearColor];
    [self.contentContainerView addSubview:self.movieBannerImageView];
}

- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = NSLocalizedString(@"Sample Movie Name", @"");
    self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:16.0f];
    self.titleLabel.textColor = [UIColor colorWithWhite:75.0/255.0 alpha:1.0];
    [self.contentContainerView addSubview:self.titleLabel];
}

#pragma mark Constraint Methods

- (void)setupConstraints {
    [self setupContainerViewConstraints];
    [self setupTitleLabelConstraints];
    [self setupBannerImagaeViewConstraints];
}

- (void)setupContainerViewConstraints {
    self.contentContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0 constant:8.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0 constant:8.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:-8.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0 constant:-8.0f]];
}

- (void)setupBannerImagaeViewConstraints {
    self.movieBannerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0 constant:10.0f]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0 constant:2.0]];
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:-2.0]];
    
    
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0 constant:120.0]];
}

- (void)setupTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:-5.0f]];
    [self.contentContainerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentContainerView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:15.0f]];
}

#pragma mark Setter Methods

- (void)setMovieListData:(HSMovieListData *)movieListData {
    _movieListData = movieListData;
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:movieListData.moviePosterLink]];
    self.titleLabel.text = movieListData.movieName;
}

@end
