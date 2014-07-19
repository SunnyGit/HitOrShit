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
    [self setCollectionViewFlowLayout];
    [self setNavigationBarLogo];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self fetchListData];
}

- (void)setCollectionViewFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(151, 250);
    flowLayout.minimumLineSpacing = 6.0;
    flowLayout.minimumInteritemSpacing = 6.0;
    flowLayout.sectionInset = UIEdgeInsetsMake(6.0, 6.0, 6.0, 6.0);
    self.moviesListCollectionView.collectionViewLayout = flowLayout;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:240.0/255.0
                                                                              green:176.0/255.0
                                                                               blue:23.0/255.0
                                                                              alpha:0.5f];
 //   [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;

}

- (void)setNavigationBarLogo {
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"navigation_logo"] resizableImageWithCapInsets:UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0)]];
    [logoImageView setFrame:CGRectMake(0.0,
                                       0.0,
                                       logoImageView.image.size.width,
                                       logoImageView.image.size.height)];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithCustomView:logoImageView];
    [self.navigationItem setLeftBarButtonItem:customItem];
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
    [self.presenter.wireframe pushMovieDetailViewControllerWithMovieListData:[self.movieListCollection objectAtIndex:indexPath.row]];
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


@end
