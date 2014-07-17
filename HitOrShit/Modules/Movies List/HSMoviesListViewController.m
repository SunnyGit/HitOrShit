//
//  HSMoviesListTableViewController.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListViewController.h"

#import "HSMoviesListCell.h"
#import "HSMovieListData.h"
#import "HSMoviesListPresenter.h"
#import "HSMovieDetailViewController.h"

@interface HSMoviesListViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *moviesListCollectionView;
@property (nonatomic, copy) NSArray *movieListCollection;

@end

@implementation HSMoviesListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(151, 250);
    flowLayout.minimumLineSpacing = 6.0;
    flowLayout.minimumInteritemSpacing = 6.0;
    flowLayout.sectionInset = UIEdgeInsetsMake(6.0, 6.0, 6.0, 6.0);
    self.moviesListCollectionView.collectionViewLayout = flowLayout;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self fetchListData];
}

- (void)registerCells {
    [self.moviesListCollectionView registerClass:[HSMoviesListCell class] forCellWithReuseIdentifier:NSStringFromClass([HSMoviesListCell class])];
}

- (void)fetchListData {
    __weak typeof(self) weakSelf = self;
    [self.presenter fecthMovieListDataWitSuccess:^(NSArray *movieListData) {
        weakSelf.movieListCollection = movieListData;
    } andWithFailure:^(NSError *error, NSArray *localMovieListData) {
        weakSelf.movieListCollection = localMovieListData;
    }];
}

#pragma mark Setter Methods

- (void)setMovieListCollection:(NSArray *)movieListCollection {
    _movieListCollection = movieListCollection;
    [self.moviesListCollectionView reloadData];
}


#pragma mark Delegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailView" sender:self];
}


#pragma mark DataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.movieListCollection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HSMoviesListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSMoviesListCell class]) forIndexPath:indexPath];
    
    HSMovieListData *listData = [self.movieListCollection objectAtIndex:indexPath.row];
    cell.movieListData = listData;
    return cell;
}

#pragma mark Segeue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HSMovieDetailViewController *detailListViewController = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [[self.moviesListCollectionView indexPathsForSelectedItems] firstObject];
    detailListViewController.movieData = [self.movieListCollection objectAtIndex:selectedIndexPath.item];
}

@end
