//
//  HSMoviesListTableViewController.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSMoviesListViewController.h"

#import "HSMoviesListCell.h"

static CGFloat const kListTableViewCellHeight = 190.0f;
static CGFloat const kSampleNumberOfRows = 15.0f;

@interface HSMoviesListViewController ()

@property (strong, nonatomic) IBOutlet UITableView *movieListTableView;

@end

@implementation HSMoviesListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    self.movieListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)registerCells {
    [self.movieListTableView registerClass:[HSMoviesListCell class]
                    forCellReuseIdentifier:NSStringFromClass([HSMoviesListCell class])];
}

#pragma mark Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kListTableViewCellHeight;
}


#pragma mark DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio {
    return kSampleNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HSMoviesListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HSMoviesListCell class])
                                                             forIndexPath:indexPath];    
    if (indexPath.row == 0) {
        cell.movieName = @"Hrudaya Kalayam";
        cell.movieBannerImage = [UIImage imageNamed:@"hrudayaKalayam.png"];
    } else if (indexPath.row == 1) {
        cell.movieName = @"Manam";
        cell.movieBannerImage = [UIImage imageNamed:@"manam.png"];
    } else {
        cell.movieName = @"Raid 2";
        cell.movieBannerImage = [UIImage imageNamed:@"Raid2.png"];
    }
    return cell;
}

@end
