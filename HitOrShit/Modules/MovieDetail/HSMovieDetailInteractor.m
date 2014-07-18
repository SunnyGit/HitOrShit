//
//  HSMovieDetailInteractor.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/17/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailInteractor.h"

#import "HOSFBDetails.h"
#import "HOSRegister.h"
#import "HOSReview.h"

@implementation HSMovieDetailInteractor

- (void)fetchMovieReviewDataForMovieId:(NSString *)movieId
                           withSuccess:(void(^)(NSArray *movieReviewData))completion
                        andWithFailure:(void(^)(NSError *error, NSArray *localReviewData))failure {
    
    HOSFBDetails *fbdetails = [HOSFBDetails MR_findFirst];
    HOSRegister *registrationDetails = [HOSRegister MR_findFirst];
    
    NSDictionary *data = @{@"user_id" : fbdetails.userid,
                           @"movie_id" : movieId,
                           @"token" : registrationDetails.sucessToken};
    
    [HOSReview startRequestWithURN:@"/movie_details"
                              data:data
                           context:[NSManagedObjectContext MR_defaultContext]
                            domain:@"com.hitorshit"
                       resultBlock:^(NSArray *records) {
                           if (completion) {
                               completion(records);
                           }
                       } failureBlock:^(NSError *error) {
                           if (failure) {
                               failure(error, [self movieReviewRecordsWithMovieId:movieId]);
                           }
                       }];

}

- (NSArray *)movieReviewRecordsWithMovieId:(NSString *)movieID {
    return [HOSReview MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"movie_id=%@",movieID]];
}

@end
