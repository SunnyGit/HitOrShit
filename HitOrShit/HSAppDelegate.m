//
//  HSAppDelegate.m
//  HitOrShit
//
//  Created by Ravi Shankar on 14/06/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "HSAppDelegate.h"

#import "HSWireframe.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MMRecord.h"
#import "HSLiveServer.h"
#import "HSAuthorisation.h"
#import "Constants.h"

@interface HSAppDelegate ()
@property (nonatomic, strong) HSWireframe *wireframe;
@end

@implementation HSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.wireframe = [[HSWireframe alloc] initWithWindow:self.window];
    [MagicalRecord setupAutoMigratingCoreDataStack];
    [MMRecord registerServerClass:[HSLiveServer class]];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    // Handle the user leaving the app while the Facebook login dialog is being shown
    // For example: when the user presses the iOS "home" button while the login dialog is active
    [FBAppCall handleDidBecomeActive];
    [HSAuthorisation requestForAuthorisationAccess:^(BOOL granted) {
        if (granted) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kRegistrationSuccessNotification
                                                                object:self];
        } else {
            [self.wireframe showLoginScreenWithAnimation:NO];
        }
    }];
}

@end
