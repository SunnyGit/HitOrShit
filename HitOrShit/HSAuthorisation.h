//
//  HSAuthorisation.h
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HSAuthorisationDelegate <NSObject>

- (void)userLoggedIn;
- (void)userLoggedOut;
- (void)showMessage:(NSString *)text withTitle:(NSString *)title;

@end

@interface HSAuthorisation : NSObject

@property (nonatomic, weak) id<HSAuthorisationDelegate> delegate;

+ (BOOL)isAuthorised;

- (void)loginWithFacebook;

+ (void)requestForAuthorisationAccess:(void(^)(BOOL granted))completionHandler;

@end
