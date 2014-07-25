//
//  HSMovieReviewViewController.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/26/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSMovieReviewViewController;

@protocol HSMovieReviewViewControllerDelegate <NSObject>

- (void)reviewController:(HSMovieReviewViewController *)reviewController
            userDidRateWithReviewText:(NSString *)reviewText
                       andRatingCount:(CGFloat)rating;

@end

@interface HSMovieReviewViewController : UIViewController

@property (nonatomic, weak) id <HSMovieReviewViewControllerDelegate> delegate;

@property (nonatomic, copy) NSString *movieName;

@property (nonatomic, copy) NSString *reviewText;

@property (nonatomic, assign) CGFloat rating;

@end
