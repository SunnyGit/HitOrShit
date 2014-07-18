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

@interface HSMovieDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *detailCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *movieBannerImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (strong, nonatomic) UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;

@property (nonatomic, copy) NSArray *reviewCollection;

@end

@implementation HSMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.detailCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.detailCollectionView registerClass:[HSMovieDetailHeaderView class]
                  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                         withReuseIdentifier:NSStringFromClass([HSMovieDetailHeaderView class])];
    [self.navigationController.navigationBar setHidden:YES];
    [self setupBackButton];
    [self setupData];
    [self fetchMovieReviewData];
}

- (void)fetchMovieReviewData {
    __weak typeof(self) weakSelf = self;
    [self.presenter fetchMovieReviewDataForMovieId:self.movieData.movieId
     withSuccess:^(NSArray *movieReviewData) {
         weakSelf.reviewCollection = movieReviewData;
    } andWithFailure:^(NSError *error, NSArray *localReviewData) {
        weakSelf.reviewCollection = localReviewData;
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
    [self.movieBannerImageView setImageWithURL:[NSURL URLWithString:self.movieData.moviePosterLink]];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
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
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
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
    return headerViewData;
}

@end
