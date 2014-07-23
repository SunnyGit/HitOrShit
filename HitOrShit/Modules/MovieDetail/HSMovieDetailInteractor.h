//
//  HSMovieDetailInteractor.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HSMovieDetailInteractorInterface <NSObject>

- (void)fetchMovieReviewDataForMovieId:(NSString *)movieId
                           withSuccess:(void(^)(NSArray *movieReviewData))completion
                        andWithFailure:(void(^)(NSError *error, NSArray *localReviewData))failure;

- (void)writeAReviewWithData:(NSString *)reviewText
              andWithMovieID:(NSString *)movieId
                 withSuccess:(void(^)())completion
              andWithFailure:(void(^)(NSError *error))failure;


- (NSArray *)movieReviewRecordsWithMovieId:(NSString *)movieID;

@end

@interface HSMovieDetailInteractor : NSObject <HSMovieDetailInteractorInterface>

@end
