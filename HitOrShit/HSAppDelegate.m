//
//  HSAppDelegate.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "HSAppDelegate.h"

#import "HSWireframe.h"

@interface HSAppDelegate ()
@property (nonatomic, strong) HSWireframe *wireframe;
@end

@implementation HSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.wireframe = [[HSWireframe alloc] initWithWindow:self.window];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
