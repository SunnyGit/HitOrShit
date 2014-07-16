//
//  HOSSessionManager.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/10/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HOSLiveSessionManager.h"

@implementation HOSLiveSessionManager

+ (instancetype)sharedSessionManager {
    HOSLiveSessionManager *sessionManager =
               [[self alloc] initWithBaseURL:[NSURL URLWithString:[[self class] baseUrlString]]];
    [sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    return sessionManager;
}

+ (NSString *)baseUrlString {
    return @"http://myreview.herokuapp.com";
}

@end
