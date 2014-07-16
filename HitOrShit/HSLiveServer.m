//
//  HSLiveServer.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/7/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HSLiveServer.h"

#import "HOSLiveSessionManager.h"

@implementation HSLiveServer

+ (AFHTTPSessionManager *)sessionManager {
    return [HOSLiveSessionManager sharedSessionManager];
}

+ (void)startRequestWithURN:(NSString *)URN
                       data:(NSDictionary *)data
                      paged:(BOOL)paged
                     domain:(id)domain
                    batched:(BOOL)batched
              dispatchGroup:(dispatch_group_t)dispatchGroup
              responseBlock:(void (^)(id responseObject))responseBlock
               failureBlock:(void (^)(NSError *error))failureBlock {
    [[self sessionManager] POST:URN
                     parameters:data
                        success:^(NSURLSessionDataTask *task, id responseObject) {
                            if (responseBlock != nil) {
                                responseBlock(responseObject);
                            }
                        } failure:^(NSURLSessionDataTask *task, NSError *error) {
                            if (failureBlock != nil) {
                                failureBlock(error);
                            }
                        }];
}

@end
