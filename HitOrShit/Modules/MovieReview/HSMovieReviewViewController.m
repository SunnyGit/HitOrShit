//
//  HSMovieReviewViewController.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/26/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieReviewViewController.h"

#import "HSMovieStarRatingView.h"
#import "UIViewController+MaryPopin.h"

#import <QuartzCore/QuartzCore.h>

@interface HSMovieReviewViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *reviewContainerView;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet HSMovieStarRatingView *ratingView;
@property (strong, nonatomic) IBOutlet UITextField *ratingViewTextField;

@end

@implementation HSMovieReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reviewContainerView.layer.cornerRadius = 10.0f;
    self.reviewContainerView.layer.masksToBounds = YES;
    self.movieNameLabel.text = self.movieName;
    // Do any additional setup after loading the view.
}

- (IBAction)rateButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(reviewController:userDidRateWithReviewText:andRatingCount:)]) {
        [self.delegate reviewController:self userDidRateWithReviewText:self.ratingViewTextField.text andRatingCount:self.ratingView.rating];
        [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:nil];
    }
}

- (IBAction)closeButtonTapped:(id)sender {
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{
        NSLog(@"Popin dismissed !");
    }];
}

- (void)setMovieName:(NSString *)movieName {
    _movieName = movieName;
    self.movieNameLabel.text = movieName;
}

#pragma mark TextField Delegate


@end
