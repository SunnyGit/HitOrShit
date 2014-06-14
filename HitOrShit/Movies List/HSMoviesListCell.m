//
//  HSMoviesListCell.m
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMoviesListCell.h"

@interface HSMoviesListCell ()

@property (nonatomic, strong) UIImageView *movieBannerImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HSMoviesListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
        [self setupConstraints];
    }
    return self;
}

#pragma mark Setup Methods

- (void)setupSubViews {
    [self setupBannerImagaeView];
    [self setupTitleLabel];
}

- (void)setupBannerImagaeView {
    self.movieBannerImageView = [[UIImageView alloc] init];
    self.movieBannerImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.movieBannerImageView];
}

- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = NSLocalizedString(@"Sample Movie Name", @"");
    self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:16.0f];
    self.titleLabel.textColor = [UIColor colorWithWhite:75.0/255.0 alpha:1.0];
    [self addSubview:self.titleLabel];
}

#pragma mark Constraint Methods

- (void)setupConstraints {
    [self setupBannerImagaeViewConstraints];
    [self setupTitleLabelConstraints];
}

- (void)setupBannerImagaeViewConstraints {
    self.movieBannerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0 constant:10.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.movieBannerImageView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0 constant:120.0]];
}

- (void)setupTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:-10.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:15.0f]];
}

#pragma mark Setter Methods

- (void)setMovieBannerImage:(UIImage *)movieBannerImage {
    _movieBannerImage = movieBannerImage;
    self.movieBannerImageView.image = movieBannerImage;
}

- (void)setMovieName:(NSString *)movieName {
    _movieName = movieName;
    self.titleLabel.text = movieName;
}

@end
