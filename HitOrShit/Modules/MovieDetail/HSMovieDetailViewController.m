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
    [self.detailCollectionView registerNib:[UINib nibWithNibName:@"HSMovieDetailViewCell"
                                                          bundle:nil]
                forCellWithReuseIdentifier:NSStringFromClass([HSMovieDetailViewCell class])];
    [self.detailCollectionView registerNib:[UINib nibWithNibName:@"HSMovieDetailHeaderView"
                                                          bundle:nil]
                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                       withReuseIdentifier:NSStringFromClass([HSMovieDetailHeaderView class])];
    [self setupBackButton];
    [self setupData];
   // [self writeAReviewWithReviewText:@"This is shit"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    [self fetchMovieReviewData];
    [self.detailCollectionView reloadData];
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

- (void)writeAReviewWithReviewText:(NSString *)reviewText {
    __weak typeof(self) weakSelf = self;

    [self.presenter writeAReviewWithData:reviewText
                          andWithMovieID:self.movieData.movieId
                             withSuccess:^{
                                 [weakSelf fetchMovieReviewData];
                             } andWithFailure:^{
                                 //TODO show alert
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
    HSMovieDetailViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSMovieDetailViewCell class])
                                                                           forIndexPath:indexPath];
    cell.cellData = [self cellDataWithIndexPath:indexPath];
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
    headerViewData.reviewCount = [NSString stringWithFormat:@"%d",[self.reviewCollection count]];
    headerViewData.average = 4.5;
    return headerViewData;
}

- (HSMovieDetailViewCellData *)cellDataWithIndexPath:(NSIndexPath *)indexPath {
    HOSReview *review = [self.reviewCollection objectAtIndex:indexPath.row];
    HSMovieDetailViewCellData *cellData = [[HSMovieDetailViewCellData alloc] init];
    cellData.profileImageUrl = review.imageURL;
    cellData.name = review.name;
    cellData.reviewText = review.review_text;
    cellData.rating = [review.start_count floatValue];
    cellData.reviewDate = review.date;
    return cellData;
}

@end
