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

#import "Constants.h"
#import "MBProgressHUD.h"

@interface HSMoviesListViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *moviesListCollectionView;
@property (nonatomic, copy) NSArray *movieListCollection;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HSMoviesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    [self setCollectionViewFlowLayout];
    [self setNavigationBarLogo];
    [self addObservers];
    [self addRefreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)setCollectionViewFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(151, 250);
    flowLayout.minimumLineSpacing = 6.0;
    flowLayout.minimumInteritemSpacing = 6.0;
    flowLayout.sectionInset = UIEdgeInsetsMake(6.0, 6.0, 6.0, 6.0);
    self.moviesListCollectionView.collectionViewLayout = flowLayout;
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

- (void)addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(registerSucces)
                                                 name:kRegistrationSuccessNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showFailureMessage)
                                                 name:kRegistrationFailureNotification
                                               object:nil];
}

- (void)addRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self action:@selector(pullToRefreshTriggered) forControlEvents:UIControlEventValueChanged];
    [self.moviesListCollectionView addSubview:self.refreshControl];
    self.moviesListCollectionView.alwaysBounceVertical = YES;
}


- (void)pullToRefreshTriggered {
    [self fetchListDataWithHUD:NO];
}

- (void)registerSucces {
    [self fetchListDataWithHUD:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)registerCells {
    [self.moviesListCollectionView registerClass:[HSMoviesListCell class] forCellWithReuseIdentifier:NSStringFromClass([HSMoviesListCell class])];
}

- (void)fetchListDataWithHUD:(BOOL)hudNecessary {
    __weak typeof(self) weakSelf = self;
    if (hudNecessary) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"fetching Movie list";
    }
    [self.presenter fecthMovieListDataWitSuccess:^(NSArray *movieListData) {
        weakSelf.movieListCollection = movieListData;
        if (hudNecessary) {
            [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
        } else {
            [weakSelf.refreshControl endRefreshing];
        }
    } andWithFailure:^(NSError *error, NSArray *localMovieListData) {
        weakSelf.movieListCollection = localMovieListData;
        if (hudNecessary) {
            [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
        } else {
            [weakSelf.refreshControl endRefreshing];
        }
    }];
}

- (void)showFailureMessage {
    // TODO handle this
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
