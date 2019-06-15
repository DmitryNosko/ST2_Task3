//
//  DetailsViewController.m
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (strong, nonatomic) UIImageView* imgView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Image";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self customBackButton];
    
    if (self.image.size.height > CGRectGetHeight(self.view.bounds) || self.image.size.width > CGRectGetWidth(self.view.bounds)) {
        self.imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
        [self.imgView setImage:self.image];
    } else {
        UINavigationBar *nav = self.navigationController.navigationBar;
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, nav.frame.size.height, self.image.size.width, self.image.size.height)];
        [self.imgView setImage:self.image];
    }

    
    [self.view addSubview:self.imgView];
}

#pragma mark - Navigation

- (void) popToRootView:(id) sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) customBackButton {
    [self.navigationItem setHidesBackButton:YES animated:YES];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"arrow_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(popToRootView:)];
    self.navigationItem.leftBarButtonItem = backButton;
}



@end

























