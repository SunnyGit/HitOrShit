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

static CGFloat const kListTableViewCellHeight = 190.0f;

@interface HSMoviesListViewController ()

@property (strong, nonatomic) IBOutlet UITableView *movieListTableView;
@property (nonatomic, copy) NSArray *movieListCollection;

@end

@implementation HSMoviesListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    self.movieListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self fetchListData];
}

- (void)registerCells {
    [self.movieListTableView registerClass:[HSMoviesListCell class]
                    forCellReuseIdentifier:NSStringFromClass([HSMoviesListCell class])];
}

- (void)fetchListData {
    __weak typeof(self) weakSelf = self;
    [self.presenter fecthMovieListDataWitSuccess:^(NSArray *movieListData) {
        weakSelf.movieListCollection = movieListData;
    } andWithFailure:nil];
}

#pragma mark Setter Methods

- (void)setMovieListCollection:(NSArray *)movieListCollection {
    _movieListCollection = movieListCollection;
    [self.movieListTableView reloadData];
}


#pragma mark Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kListTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailView" sender:self];
}


#pragma mark DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio {
    return [self.movieListCollection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HSMoviesListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HSMoviesListCell class])
                                                             forIndexPath:indexPath];
    
    HSMovieListData *listData = [self.movieListCollection objectAtIndex:indexPath.row];
    cell.movieListData = listData;
    return cell;
}

#pragma mark Segeue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HSMovieDetailViewController *detailListViewController = segue.destinationViewController;
    detailListViewController.movieData = [self.movieListCollection objectAtIndex:[self.movieListTableView indexPathForSelectedRow].row];
}

@end
