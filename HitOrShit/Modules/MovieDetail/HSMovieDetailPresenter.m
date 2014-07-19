//
//  HSMovieDetailViewPresenter.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailPresenter.h"

@implementation HSMovieDetailPresenter

- (void)fetchMovieReviewDataForMovieId:(NSString *)movieId
                           withSuccess:(void(^)(NSArray *movieReviewData))completion
                        andWithFailure:(void(^)(NSError *error, NSArray *localReviewData))failure {
    [self.interactor fetchMovieReviewDataForMovieId:movieId
                                        withSuccess:^(NSArray *movieReviewData) {
                                            if (completion) {
                                                completion(movieReviewData);
                                            }
                                        } andWithFailure:^(NSError *error, NSArray *localReviewData) {
                                            if (failure) {
                                                failure(error,localReviewData);
                                            }
                                        }];
}

- (void)writeAReviewWithData:(NSString *)reviewText
              andWithMovieID:(NSString *)movieId
                 withSuccess:(void(^)())completion
              andWithFailure:(void(^)())failure {
    [self.interactor writeAReviewWithData:reviewText
                           andWithMovieID:movieId withSuccess:completion andWithFailure:failure];
}
@end
