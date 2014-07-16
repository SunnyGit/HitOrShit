#import "HOSRegister.h"


@interface HOSRegister ()

// Private interface goes here.

@end


@implementation HOSRegister

+ (NSString *)keyPathForResponseObject {
    return @"data.result";
}

+ (void)registerNewUserWithData:(NSDictionary *)data
                    resultBlock:(void(^)(NSArray *records))resultBlock
                   failureBlock:(void(^)(NSError *error))failureBlock {
    [[self class] startRequestWithURN:@"/register"
                         data:data
                      context:[NSManagedObjectContext MR_defaultContext]
                       domain:@"com.HitOrShit"
                  resultBlock:^(NSArray *records) {
                      resultBlock(records);
                  } failureBlock:^(NSError *error) {
                      failureBlock(error);
                  }];
}

@end
