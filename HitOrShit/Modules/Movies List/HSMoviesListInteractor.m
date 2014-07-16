//
//  HSMoviesListInteractor.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListInteractor.h"

#import "HOSMovies.h"
#import "HOSFBDetails.h"
#import "HOSRegister.h"

@implementation HSMoviesListInteractor

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure {
    HOSFBDetails *fbdetails = [HOSFBDetails MR_findFirst];
    HOSRegister *registrationDetails = [HOSRegister MR_findFirst];
    
    NSDictionary *data = @{@"user_id" : fbdetails.userid,
                           @"token" : registrationDetails.sucessToken};
    
   [HOSMovies startRequestWithURN:@"/movies"
                             data:data
                          context:[NSManagedObjectContext MR_defaultContext]
                           domain:@"com.hitorshit"
                      resultBlock:^(NSArray *records) {
                          if (completion) {
                              completion(records);
                          }
                      } failureBlock:failure];
}

@end
