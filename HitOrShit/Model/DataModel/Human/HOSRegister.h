#import "_HOSRegister.h"

@interface HOSRegister : _HOSRegister {}
// Custom logic goes here.

+ (void)registerNewUserWithData:(NSDictionary *)data
                   successBlock:(void(^)())successBlock
                   failureBlock:(void(^)(NSError *error))failureBlock;

@end
