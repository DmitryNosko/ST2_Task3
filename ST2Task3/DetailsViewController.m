//
//  DetailsViewController.m
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "DetailsViewController.h"
#import "MainViewController.h"

@interface DetailsViewController ()
@property (strong, nonatomic) UIImageView* imgView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imageWasLoadNotification:)
                                                 name:MainViewControllerImageWasLoadNotification
                                               object:nil];
    [self setUpViewController];
    [self setImageView:self.image];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Navigation

- (void) popToRootView:(id) sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Notification

- (void) imageWasLoadNotification:(NSNotification*) notification {
    
    if([[notification name] isEqualToString:MainViewControllerImageWasLoadNotification]) {
        UIImage* image = [notification.userInfo objectForKey:self.imageUrl];
        if (image) {
            [self setImageView:image];
            [self.imgView reloadInputViews];
            [self.view reloadInputViews];
        }
    }
}

#pragma mark - Methods

- (void) setUpViewController {
    self.title = @"Image";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"arrow_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(popToRootView:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void) setImageView:(UIImage*) image {
    
    self.imgView = [self isGreaterThanViewFrame:image] ?
        [[UIImageView alloc] initWithFrame:CGRectMake(10, [self getTobBarHeight], (CGRectGetWidth(self.view.bounds) - 20.f), (CGRectGetHeight(self.view.bounds)) - [self getTobBarHeight] - 10.f)] :
        [[UIImageView alloc] initWithFrame:CGRectMake(10, [self getTobBarHeight], image.size.width, image.size.height)];
    
    [self.imgView setImage:image];
    [self.view reloadInputViews];
    [self.view addSubview:self.imgView];
}

- (CGFloat) getTobBarHeight {
    return ([UIApplication sharedApplication].statusBarFrame.size.height + (self.navigationController.navigationBar.frame.size.height ?: 0.0) + 10.f);
}

- (BOOL) isGreaterThanViewFrame:(UIImage*) image {
    return image.size.height > (CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.navigationController.navigationBar.bounds)) ||
           image.size.width > CGRectGetWidth(self.view.bounds);
}


@end

























