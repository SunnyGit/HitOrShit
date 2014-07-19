//
//  UIFont+HSFont.m
//  HitOrShit
//
//  Created by Ravi Shankar on 19/07/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "UIFont+HSFont.h"

NSString *const HS_FONT_ProximaNova_Bold = @"ProximaNova-Bold";
NSString *const HS_FONT_ProximaNova_Regular = @"ProximaNova-Regular";

@implementation UIFont (HSFont)

+ (UIFont *)boldApplicationFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:HS_FONT_ProximaNova_Bold size:size];
}

+ (UIFont *)regularApplicationFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:HS_FONT_ProximaNova_Regular size:size];
}

@end
