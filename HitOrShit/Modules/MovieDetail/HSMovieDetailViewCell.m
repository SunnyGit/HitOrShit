//
//  HSMovieDetailViewCell.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/20/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailViewCell.h"

#import "HSMovieStarRatingView.h"
#import "HSMovieDetailViewCellData.h"
#import "UIImageView+AfNetworking.h"
#import <QuartzCore/QuartzCore.h>

@interface HSMovieDetailViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewDateLabel;
@property (weak, nonatomic) IBOutlet HSMovieStarRatingView *ratingView;
@property (weak, nonatomic) IBOutlet UIView *cellcontentView;

@property (weak, nonatomic) IBOutlet UILabel *reviewTextLabel;

@end

@implementation HSMovieDetailViewCell

- (void)updateSubViewsProperties {
    self.profileImageView.layer.masksToBounds = YES;
    self.cellcontentView.layer.cornerRadius = 3.0f;
    self.profileImageView.layer.cornerRadius = 30.0f;
    self.ratingView.maxAllowedRating = 5;
    self.ratingView.rating = 3.5;
    self.ratingView.backgroundColor = [UIColor clearColor];
}

#pragma mark Setter Methods

- (void)setCellData:(HSMovieDetailViewCellData *)cellData {
    _cellData = cellData;
    [self.profileImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@normal",cellData.profileImageUrl]]];
    self.userNameLabel.text = cellData.name;
    self.reviewDateLabel.text = cellData.reviewDate;
    self.ratingView.rating = cellData.rating;
    self.reviewTextLabel.text = cellData.reviewText;
}

@end
