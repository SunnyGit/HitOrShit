//
//  HSMoviesListInteractor.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListInteractor.h"

@implementation HSMoviesListInteractor

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure {
    // TODO This will always call success block
    if (completion) {
        completion([[NSArray alloc] initWithObjects:@"Sample1",@"Sample2",@"Sample3", nil]);
    }
}

@end
