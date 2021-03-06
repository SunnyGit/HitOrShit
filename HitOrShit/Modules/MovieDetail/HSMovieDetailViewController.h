//
//  HSMovieDetailViewController.h
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSMovieListData;
@class HSMovieDetailPresenter;

@interface HSMovieDetailViewController : UIViewController

@property (nonatomic, strong) HSMovieListData *movieData;

@property (nonatomic, strong) HSMovieDetailPresenter *presenter;

@end
