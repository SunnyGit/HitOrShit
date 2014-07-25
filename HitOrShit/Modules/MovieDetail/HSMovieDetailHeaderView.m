//
//  HSMovieDetailHeaderView.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailHeaderView.h"

#import <UIImageView+AFNetworking.h>
#import "HSMovieStarRatingView.h"
#import "HSMovieDetailHeaderViewData.h"


@interface HSMovieDetailHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *moviePosterImageView;
@property (weak, nonatomic) IBOutlet UILabel *ratingAvergaeValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewCountLabel;
@property (weak, nonatomic) IBOutlet HSMovieStarRatingView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;

@end

@implementation HSMovieDetailHeaderView
 
#pragma mark Setter Methods

- (void)setHeaderData:(HSMovieDetailHeaderViewData *)headerData {
    _headerData = headerData;
    self.movieNameLabel.text = headerData.movieName;
    [self.moviePosterImageView setImageWithURL:[NSURL URLWithString:headerData.moviePostUrl] placeholderImage:nil];
    self.ratingAvergaeValueLabel.text = [NSString stringWithFormat:@"%.1f",headerData.average];
    self.ratingView.canEdit = NO;
    self.ratingView.maxAllowedRating = 5;
    self.ratingView.rating = headerData.average;
    self.reviewCountLabel.text = [NSString stringWithFormat:@"%@ Reviews",headerData.reviewCount];
}



@end
