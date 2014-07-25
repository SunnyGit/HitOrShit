//
//  HSMovieDetailViewController.h
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GAI.h"

@class HSMovieListData;
@class HSMovieDetailPresenter;

@interface HSMovieDetailViewController : GAITrackedViewController

@property (nonatomic, strong) HSMovieListData *movieData;

@property (nonatomic, strong) HSMovieDetailPresenter *presenter;

@end
