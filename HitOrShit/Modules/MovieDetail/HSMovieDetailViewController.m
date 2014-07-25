//
//  HSMovieDetailViewController.m
//  HitOrShit
//
//  Created by Sunil Gandham on 6/15/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSMovieDetailViewController.h"

#import "HSMovieListData.h"
#import "UIImageView+AFNetworking.h"
#import "HOSReview.h"
#import "HOSFBDetails.h"
#import "HOSRegister.h"
#import "HSMovieDetailPresenter.h"
#import "HSMovieDetailHeaderView.h"
#import "HSMovieDetailHeaderViewData.h"
#import "HSMovieDetailViewCell.h"
#import "HSMovieDetailViewCellData.h"
#import "HOSReview.h"
#import "HSMovieReviewViewController.h"
#import "UIViewController+MaryPopin.h"

#import "MBProgressHUD.h"

@interface HSMovieDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,HSMovieReviewViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *detailCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *movieBannerImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (strong, nonatomic) UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, copy) NSArray *reviewCollection;
@property (weak, nonatomic) IBOutlet UIButton *rateButton;
@property (nonatomic, strong) HSMovieReviewViewController *reviewController;

@property (nonatomic, copy) NSString *currentReview;
@property (nonatomic, assign) CGFloat rating;

@end

@implementation HSMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"Movie Detail Screen";
    [self.detailCollectionView registerNib:[UINib nibWithNibName:@"HSMovieDetailViewCell"
                                                          bundle:nil]
                forCellWithReuseIdentifier:NSStringFromClass([HSMovieDetailViewCell class])];
    [self.detailCollectionView registerNib:[UINib nibWithNibName:@"HSMovieDetailHeaderView"
                                                          bundle:nil]
                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                       withReuseIdentifier:NSStringFromClass([HSMovieDetailHeaderView class])];
    [self setupBackButton];
    [self setupData];
    [self addRefreshControl];
    [self.view bringSubviewToFront:self.rateButton];
}

- (IBAction)rateButtonTapped:(id)sender {
    self.reviewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HSMovieReviewViewController"];
    [self.reviewController setPopinTransitionStyle:BKTPopinTransitionStyleSlide];
    self.reviewController.movieName = self.movieData.movieName;
    self.reviewController.delegate = self;
    //Create a blur parameters object to configure background blur
    BKTBlurParameters *blurParameters = [BKTBlurParameters new];
    blurParameters.alpha = 1.0f;
    blurParameters.radius = 8.0f;
    blurParameters.saturationDeltaFactor = 1.8f;
    blurParameters.tintColor = [UIColor colorWithRed:0.966 green:0.851 blue:0.038 alpha:0.2];
    [self.reviewController setBlurParameters:blurParameters];
    
    //Add option for a blurry background
    [self.reviewController setPopinOptions:[self.reviewController popinOptions]|BKTPopinBlurryDimmingView];
    
    
    [self.reviewController setPreferedPopinContentSize:CGSizeMake(300.0f, 270.0f)];
    
    //Set popin transition direction
    [self.reviewController setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self presentPopinController:self.reviewController animated:YES completion:^{
        NSLog(@"Popin presented !");
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    [self fetchMovieReviewDataWithHUD:YES];
    [self.detailCollectionView reloadData];
}

- (void)fetchMovieReviewDataWithHUD:(BOOL)hudNecessary {
    __weak typeof(self) weakSelf = self;
    if (hudNecessary) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Fetching Details";
    }

    [self.presenter fetchMovieReviewDataForMovieId:self.movieData.movieId
     withSuccess:^(NSArray *movieReviewData) {
         if (hudNecessary) {
             [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
         } else {
             [self.refreshControl endRefreshing];
         }
         weakSelf.reviewCollection = movieReviewData;
    } andWithFailure:^(NSError *error, NSArray *localReviewData) {
        if (hudNecessary) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        } else {
            [self.refreshControl endRefreshing];
        }        weakSelf.reviewCollection = localReviewData;
    }];
}

- (void)writeAReviewWithReviewText:(NSString *)reviewText andStarCount:(CGFloat)starCount {
    __weak typeof(self) weakSelf = self;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Posting Review ...";
    [self.presenter writeAReviewWithData:reviewText
                          andWithMovieID:self.movieData.movieId
                             andWithRating:starCount
                             withSuccess:^{
                                 [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
                                 weakSelf.currentReview = nil;
                                 weakSelf.rating = 1.0f;
                                 [weakSelf fetchMovieReviewDataWithHUD:YES];
                             } andWithFailure:^(NSError *error) {
                                 // TODO
                             }];
}

- (void)setReviewCollection:(NSArray *)reviewCollection {
    _reviewCollection = reviewCollection;
    [self.detailCollectionView reloadData];
}

#pragma mark Setup Methods

- (void)setupBackButton {
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setTitle:@"<-" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0f]];
    self.backButton.titleLabel.textColor = [UIColor redColor];
    [self.view addSubview:self.backButton];
    [self addConstraintsToBackButton];
}

- (void)setupData {
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:self.movieData.moviePosterLink] placeholderImage:nil];
}

- (void)addRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self action:@selector(pullToRefreshTriggered) forControlEvents:UIControlEventValueChanged];
    [self.detailCollectionView addSubview:self.refreshControl];
    self.detailCollectionView.alwaysBounceVertical = YES;
}

- (void)pullToRefreshTriggered {
    [self fetchMovieReviewDataWithHUD:NO];
}

#pragma Actions

- (void)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma Constraints

- (void)addConstraintsToBackButton {
    self.backButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0 constant:20.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0 constant:20.0]];
}

#pragma mark Delegate & Datasource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.reviewCollection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HSMovieDetailViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSMovieDetailViewCell class])
                                                                           forIndexPath:indexPath];
    cell.cellData = [self.reviewCollection objectAtIndex:indexPath.row];
    [cell updateSubViewsProperties];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(320.0f, 360.0f);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    HSMovieDetailHeaderView *view = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                  withReuseIdentifier:NSStringFromClass([HSMovieDetailHeaderView class])
                                                         forIndexPath:indexPath];
        view.headerData = [self headerViewData];
    }
    return view;
}

- (HSMovieDetailHeaderViewData *)headerViewData {
    HSMovieDetailHeaderViewData *headerViewData = [[HSMovieDetailHeaderViewData alloc] init];
    headerViewData.movieName = self.movieData.movieName;
    headerViewData.moviePostUrl = self.movieData.moviePosterLink;
    headerViewData.reviewCount = [NSString stringWithFormat:@"%lu",[self.reviewCollection count]];
    headerViewData.average = 4.5;
    return headerViewData;
}

#pragma mark delegate methods


- (void)reviewController:(HSMovieReviewViewController *)reviewController
        userDidRateWithReviewText:(NSString *)reviewText
                  andRatingCount:(CGFloat)rating; {
    self.currentReview = reviewText;
    self.rating = rating;
    [self writeAReviewWithReviewText:reviewText andStarCount:rating];
}

@end
