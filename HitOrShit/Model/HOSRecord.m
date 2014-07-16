//
//  HOSRecord.m
//  HitOrShit
//
//  Created by Sunil Gandham on 7/6/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "HOSRecord.h"

static NSDateFormatter *HOSDateFormatter;


@implementation HOSRecord

+ (NSString *)keyPathForResponseObject {
    return @"";
}


+ (NSDateFormatter *)dateFormatter {
    if (!HOSDateFormatter) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; // "2012-11-21T03:57:39Z"
        HOSDateFormatter = dateFormatter;
    }
    return HOSDateFormatter;
}

@end
