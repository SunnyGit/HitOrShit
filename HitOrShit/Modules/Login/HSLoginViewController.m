//
//  HSLoginViewController.m
//  HitOrShit
//
//  Created by Ravi Shankar on 22/06/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "HSLoginViewController.h"

#import "HSLoginPresenter.h"
#import "UIFont+HSFont.h"

@interface HSLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (assign, nonatomic) CGFloat colorFloatValue;

@end

@implementation HSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBorderToButton];
    [self setFontsToSubview];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setBorderToButton {
    [self.facebookButton.layer setBorderColor:[[UIColor colorWithRed:79.0/255.0
                                                                  green:98.0/255.0
                                                                   blue:175.0/255.0
                                                                  alpha:1.0] CGColor]];
    [self.facebookButton.layer setBorderWidth:1.0f];
    [self.facebookButton.layer setCornerRadius:2.0f];
}

- (void)setFontsToSubview {
    [self.captionLabel setFont:[UIFont regularApplicationFontWithSize:16.0f]];
    [self.facebookButton.titleLabel setFont:[UIFont regularApplicationFontWithSize:16.0f]];
}

- (IBAction)loginWithFacebookClicked:(id)sender {
    [self.presenter loginWithFacebook];
}

@end
