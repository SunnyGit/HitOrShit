//
//  HSWireframe.h
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HSMovieListData;

@interface HSWireframe : NSObject

- (instancetype)initWithWindow:(UIWindow *)window;

- (void)showLoginScreenWithAnimation:(BOOL)animate;

- (void)loginWithFacebook;

- (void)pushMovieDetailViewControllerWithMovieListData:(HSMovieListData *)data;

@end
