//
//  HOSSessionManager.h
//  HitOrShit
//
//  Created by Sunil Gandham on 7/10/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HOSLiveSessionManager : AFHTTPSessionManager

/**
 Singleton Session manager instance.
 */
+ (instancetype)sharedSessionManager;

@end
