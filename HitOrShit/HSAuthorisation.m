//
//  HSAuthorisation.m
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSAuthorisation.h"

#import <FacebookSDK/FacebookSDK.h>
#import "HOSFBDetails.h"

NSString * const kAuthorisationTypeKey = @"authorisationType";

typedef NS_ENUM(NSInteger, authorisationType) {
    authorisationTypeUndefined,
	authorisationTypeFacebook,
	authorisationTypeTwitter,
	authorisationTypeGmail
};

@implementation HSAuthorisation

+ (BOOL)isAuthorised {
    NSInteger authorisationType = [[NSUserDefaults standardUserDefaults] integerForKey:kAuthorisationTypeKey];
    if (authorisationType == authorisationTypeFacebook) {
        return [self isFacebookAuthorised];
    } else if (authorisationType == authorisationTypeTwitter) {
        return [self isTwitterAuthorised];
    } else if (authorisationType == authorisationTypeGmail) {
        return [self isGmailAuthorised];
    }
    return NO;
}

+ (BOOL)isFacebookAuthorised{
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded ||
        FBSession.activeSession.state == FBSessionStateOpen) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isTwitterAuthorised {
    //TODO: Implement oin later version
    return NO;
}

+ (BOOL)isGmailAuthorised {
    //TODO: Implement oin later version
    return NO;
}

+ (void)requestForAuthorisationAccess:(void(^)(BOOL granted))completionHandler {
    NSInteger authorisationType = [[NSUserDefaults standardUserDefaults] integerForKey:kAuthorisationTypeKey];
    if (authorisationType == authorisationTypeFacebook) {
        [self requestForFacebookAccess:completionHandler];
    } else if (authorisationType == authorisationTypeTwitter) {
        //TODO: Implement for twitter
    } else if (authorisationType == authorisationTypeGmail) {
        //TODO: Implement for Gmail
    } else {
        completionHandler (NO);
    }
}

+ (void)requestForFacebookAccess:(void(^)(BOOL granted))completionHandler {
    if ([self isFacebookAuthorised]) {
        [[[FBSession activeSession]
          initWithPermissions:@[@"public_profile", @"email", @"user_friends"]]
         openWithBehavior:FBSessionLoginBehaviorUseSystemAccountIfPresent
         completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
             if (error == nil) {
                 completionHandler(YES);
                 [self fetchUserDetailsWith:session withCompletionBlock:nil];
             } else {
                 completionHandler(NO);
             }
         }];
    } else {
        completionHandler(NO);
    }
}

+ (void)fetchUserDetailsWith:(FBSession *)session withCompletionBlock:(void (^)(void))completion {
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    FBRequest *request = [FBRequest requestForMe];
    request.session =session;
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSLog(@" result : %@, error : %@",result,error);
        HOSFBDetails *fbDetails = [HOSFBDetails MR_findFirstByAttribute:HOSFBDetailsAttributes.userid
                                                              withValue:[result objectForKey:@"id"]];
        if (fbDetails == nil) {
            fbDetails = [HOSFBDetails MR_createEntity];
            fbDetails.userid = [result objectForKey:@"id"];
        }
        fbDetails.firstName = [result objectForKey:@"first_name"];
        fbDetails.lastName = [result objectForKey:@"last_name"];
        fbDetails.email = [result objectForKey:@"email"];
        fbDetails.profileLink = [result objectForKey:@"link"];
        fbDetails.name = [result objectForKey:@"name"];

        [context MR_saveOnlySelfAndWait];
        
        if (completion) {
            completion();
        }
        [self fetchFriendsDetailsWith:session];
    }];
}

+ (void)fetchFriendsDetailsWith:(FBSession *)session {
    FBRequest *request = [FBRequest requestForMyFriends];
    request.session =session;
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSLog(@" Friends : %@, error : %@",result,error);
    }];
}

- (void)loginWithFacebook {
    [[NSUserDefaults standardUserDefaults] setInteger:authorisationTypeFacebook forKey:kAuthorisationTypeKey];
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        [FBSession.activeSession closeAndClearTokenInformation];
    } else {
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             [self sessionStateChanged:session state:state error:error];
         }];
    }
}

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error {
    if (!error && state == FBSessionStateOpen) {
        [[self class] fetchUserDetailsWith:session withCompletionBlock:^{
            [self.delegate userLoggedIn];
        }];
        return;
    }
    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed){
        [self.delegate userLoggedOut];
    }
    
    if (error){
        NSString *alertText;
        NSString *alertTitle;
        if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
            alertTitle = @"Something went wrong";
            alertText = [FBErrorUtility userMessageForError:error];
            [self.delegate showMessage:alertText withTitle:alertTitle];
        } else {
            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
                // Handle session closures that happen outside of the app
            } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
                alertTitle = @"Session Error";
                alertText = @"Your current session is no longer valid. Please log in again.";
                [self.delegate showMessage:alertText withTitle:alertTitle];
            } else {
                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
                
                alertTitle = @"Something went wrong";
                alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
                [self.delegate showMessage:alertText withTitle:alertTitle];
            }
        }
        [FBSession.activeSession closeAndClearTokenInformation];
        [self.delegate userLoggedOut];
    }
}

@end
