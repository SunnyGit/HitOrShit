#import "_HOSRegister.h"

@interface HOSRegister : _HOSRegister {}
// Custom logic goes here.

+ (void)registerNewUserWithData:(NSDictionary *)data
                    resultBlock:(void(^)(NSArray *records))resultBlock
                   failureBlock:(void(^)(NSError *error))failureBlock;

@end
