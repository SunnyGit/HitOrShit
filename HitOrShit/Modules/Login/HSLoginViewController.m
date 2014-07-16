//
//  HSLoginViewController.m
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSLoginViewController.h"

#import "HSLoginPresenter.h"

@interface HSLoginViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (assign, nonatomic) CGFloat colorFloatValue;

@end

@implementation HSLoginViewController

- (IBAction)loginWithFacebookClicked:(id)sender {
    [self.presenter loginWithFacebook];
}

@end
