//
//  HSMovieDetailViewPresenter.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailPresenter.h"

#import "HOSReview.h"
#import "HSMovieDetailViewCellData.h"

@implementation HSMovieDetailPresenter

- (void)fetchMovieReviewDataForMovieId:(NSString *)movieId
                           withSuccess:(void(^)(NSArray *movieReviewData))completion
                        andWithFailure:(void(^)(NSError *error, NSArray *localReviewData))failure {
    [self.interactor fetchMovieReviewDataForMovieId:movieId
                                        withSuccess:^(NSArray *movieReviewData) {
                                            NSArray *reviewArray = [self prepareMovieReviewListDataForView:movieReviewData];
                                            if (completion) {
                                                completion(reviewArray);
                                            }
                                        } andWithFailure:^(NSError *error, NSArray *localReviewData) {
                                             NSArray *reviewArray = [self prepareMovieReviewListDataForView:localReviewData];
                                            if (failure) {
                                                failure(error,reviewArray);
                                            }
                                        }];
}


- (void)writeAReviewWithData:(NSString *)reviewText
              andWithMovieID:(NSString *)movieId
               andWithRating:(CGFloat)rating
                 withSuccess:(void(^)())completion
              andWithFailure:(void(^)(NSError *error))failure; {
    [self.interactor writeAReviewWithData:reviewText
                           andWithMovieID:movieId
                            andWithRating:rating
                              withSuccess:completion
                           andWithFailure:failure];
}

- (NSArray *)prepareMovieReviewListDataForView:(NSArray *)movieReviewData {
    NSMutableArray *reviewArray = [NSMutableArray array];
    for (HOSReview *review in movieReviewData) {
        [reviewArray addObject:[self reviewListDataWithReview:review]];
    }
    return reviewArray;
}

- (HSMovieDetailViewCellData *)reviewListDataWithReview:(HOSReview *)review {
    HSMovieDetailViewCellData *reviewData = [[HSMovieDetailViewCellData alloc] init];
    reviewData.profileImageUrl = review.imageURL;
    reviewData.name = review.name;
    reviewData.reviewDate = [self foramttedReviewDateForDate:review.date];
    reviewData.rating = [review.start_count floatValue];
    reviewData.reviewText = review.review_text;
    return reviewData;
}

- (NSString *)foramttedReviewDateForDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	return [dateFormatter stringFromDate:date];
}

@end
