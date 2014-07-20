//
//  HSMovieDetailViewCell.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/20/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSMovieDetailViewCellData;

@interface HSMovieDetailViewCell : UICollectionViewCell

- (void)updateSubViewsProperties;

@property (nonatomic, strong) HSMovieDetailViewCellData *cellData;

@end
