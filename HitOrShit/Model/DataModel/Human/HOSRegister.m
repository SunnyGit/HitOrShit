#import "HOSRegister.h"


@interface HOSRegister ()

// Private interface goes here.

@end


@implementation HOSRegister

+ (NSString *)keyPathForResponseObject {
    return @"result";
}

+ (void)registerNewUserWithData:(NSDictionary *)data
                   successBlock:(void(^)())successBlock
                   failureBlock:(void(^)(NSError *error))failureBlock; {
    [[self class] startRequestWithURN:@"/register"
                         data:data
                      context:[NSManagedObjectContext MR_defaultContext]
                       domain:@"com.HitOrShit"
                  resultBlock:^(NSArray *records) {
                      if (successBlock) {
                          successBlock();
                      };
                  } failureBlock:^(NSError *error) {
                      failureBlock(error);
                  }];
}

@end
