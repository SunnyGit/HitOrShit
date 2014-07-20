//
//  HSMovieDetailViewCellData.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/20/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSMovieDetailViewCellData : NSObject

@property (nonatomic, copy) NSString *profileImageUrl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *reviewDate;

@property (nonatomic, assign) CGFloat rating;

@property (nonatomic, copy) NSString *reviewText;

@end
