 //
//  HSMoviesListPresenter.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListPresenter.h"

#import "HSMovieListData.h"

@implementation HSMoviesListPresenter

- (void)fecthMovieListDataWitSuccess:(void(^)(NSArray *movieListData))completion
                      andWithFailure:(void(^)(NSError *error))failure {
    [self.interactor fecthMovieListDataWitSuccess:^(NSArray *movieListData) {
        NSArray *movieArray = [self prepareMovieListDataForView:movieListData];
        if (completion) {
            completion(movieArray);
        }
    } andWithFailure:^(NSError *error) {
        // TODO Handle the error block
    }];
}

- (NSArray *)prepareMovieListDataForView:(NSArray *)movieArray {
    NSMutableArray *listArray = [NSMutableArray array];
    for (NSString *name in movieArray) {
        if ([name isEqualToString:@"Sample1"]) {
            [listArray addObject:[self sample1ListData1]];
        } else if ([name isEqualToString:@"Sample2"]) {
            [listArray addObject:[self sample1ListData2]];
        } else {
            [listArray addObject:[self sample1ListData3]];
        }
    }
    return (NSArray *)listArray;
}

- (HSMovieListData *)sample1ListData1 {
    HSMovieListData *listData = [[HSMovieListData alloc] init];
    listData.movieBannerImage = [UIImage imageNamed:@"hrudayaKalayam.png"];
    listData.movieName = @"Hrudaya Kalayam";
    return listData;
}

- (HSMovieListData *)sample1ListData2 {
    HSMovieListData *listData = [[HSMovieListData alloc] init];
    listData.movieBannerImage = [UIImage imageNamed:@"manam.png"];
    listData.movieName = @"Manam";
    return listData;
}

- (HSMovieListData *)sample1ListData3 {
    HSMovieListData *listData = [[HSMovieListData alloc] init];
    listData.movieBannerImage = [UIImage imageNamed:@"Raid2.png"];
    listData.movieName = @"TheRaid2";
    return listData;
}

@end
