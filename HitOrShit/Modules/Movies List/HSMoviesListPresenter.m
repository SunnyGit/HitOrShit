 //
//  HSMoviesListPresenter.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListPresenter.h"

#import "HSMovieListData.h"
#import "HSAuthorisation.h"

#import "HOSMovies.h"

@implementation HSMoviesListPresenter

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure {
    [HSAuthorisation requestForAuthorisationAccess:^(BOOL granted) {
        if (granted) {
            [self.interactor fecthMovieListDataWitSuccess:^(NSArray *movieListData) {
                NSArray *movieArray = [self prepareMovieListDataForView:movieListData];
                if (completion) {
                    completion(movieArray);
                }
            } andWithFailure:^(NSError *error) {
                // TODO Handle the error block
            }];
        } else {
            [self.wireframe showLoginScreenWithAnimation:NO];
        }
    }];
}

- (NSArray *)prepareMovieListDataForView:(NSArray *)movieArray {
    NSMutableArray *listArray = [NSMutableArray array];
    for (HOSMovies *movie in movieArray) {
        [listArray addObject:[self movieListDataWithMovie:movie]];
    }
    return (NSArray *)listArray;
}

- (HSMovieListData *)movieListDataWithMovie:(HOSMovies *)movie {
    HSMovieListData *listData = [[HSMovieListData alloc] init];
    listData.movieName = movie.title;
    listData.movieId = movie.movie_id;
    listData.moviePosterLink = movie.moviePoster;
    return listData;
}

@end
