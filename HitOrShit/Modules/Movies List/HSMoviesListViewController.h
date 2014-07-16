//
//  HSMoviesListTableViewController.h
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSMoviesListPresenter;

@interface HSMoviesListViewController : UIViewController

@property (strong, nonatomic) HSMoviesListPresenter *presenter;

@end
