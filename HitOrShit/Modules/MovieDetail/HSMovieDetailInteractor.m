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
#import "HSLiveServer.h"

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

- (void)writeAReviewWithData:(NSString *)reviewText
              andWithMovieID:(NSString *)movieId
                 withSuccess:(void(^)())completion
              andWithFailure:(void(^)(NSError *))failure {
    NSDictionary *data = nil;
    HOSFBDetails *fbdetails = [HOSFBDetails MR_findFirst];
    HOSRegister *registrationDetails = [HOSRegister MR_findFirst];
    if (fbdetails != nil && registrationDetails != nil && movieId != nil && reviewText != nil) {
        data = @{@"user_id": fbdetails.userid,
                 @"name": fbdetails.name,
                 @"movie_id":movieId,
                 @"review":reviewText,
                 @"token": registrationDetails.sucessToken,
                 @"stars": @(4)
                 };
    }
   
    [HSLiveServer startRequestWithURN:@"/write_review"
                                 data:data
                                paged:NO
                               domain:@"com.HitorShit"
                              batched:NO
                        dispatchGroup:nil
                        responseBlock:^(id responseObject) {
                            if (completion) {
                                completion();
                            }
                        } failureBlock:^(NSError *error) {
                            if (failure) {
                                failure(error);
                            }
                        }];
}

@end
