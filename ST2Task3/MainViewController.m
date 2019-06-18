//
//  MainViewController.m
//  ST2Task3
//
//  Created by Dima on 6/14/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"
#import "DetailsViewController.h"
#import "ImageItem.h"
#import "ImageDataSource.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, CustomCellListener>

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSArray<ImageItem*>* imageItems;
@property (strong, nonatomic) NSCache* cache;


@end

NSString* const MainViewControllerImageWasLoadNotification = @"MainViewControllerImageWasLoadNotification";
static NSString* cellIdentifier = @"Cell";

@implementation MainViewController


- (void) loadView {
    [super loadView];
    [self tableViewSetUp];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Images library";
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:cellIdentifier];
    
    ImageDataSource* dataSource = [[ImageDataSource alloc] init];
    self.imageItems = [dataSource getAllImageItems];
    
    self.cache = [[NSCache alloc] init];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.imageItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell* cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.listener = self;
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [self setCellContent:cell indexPath:indexPath];
    
    
    return cell;
}

#pragma mark - ContentSetUp

- (void) setCellContent:(CustomCell*) cell indexPath:(NSIndexPath*) indexPath {
    ImageItem* imageItem = self.imageItems[indexPath.row];
    
    cell.infoLabel.text = imageItem.imageUrl.absoluteString;
    UIImage* cachedImage = [self.cache objectForKey:imageItem.imageUrl.absoluteString];
    
    if (cachedImage) {
        cell.imgView.image = cachedImage;
    } else {
        [cell.imgView setImage:[UIImage imageNamed:@"noPhoto"]];
        [self downloadImage:cell item:imageItem];
    }
}

- (void) downloadImage:(CustomCell*) cell item:(ImageItem*) imageItem {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:imageItem.imageUrl];
        imageItem.image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageItem.image) {
                
                cell.infoLabel.text = imageItem.imageUrl.absoluteString;
                cell.imgView.image = imageItem.image;
                
                [self.cache setObject:imageItem.image forKey:imageItem.imageUrl.absoluteString];
                
                NSDictionary* dictionary = [NSDictionary dictionaryWithObject:imageItem.image forKey:imageItem.imageUrl.absoluteString];
                [[NSNotificationCenter defaultCenter] postNotificationName:MainViewControllerImageWasLoadNotification
                                                                    object:nil
                                                                    userInfo:dictionary];
            }
            
        });
    });
}

#pragma mark - TableViewSetUp

- (void) tableViewSetUp {
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                              [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                              [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
                                              ]];
}

#pragma mark - DidTapOnImage

- (void) didTapOnImage:(UIImageView*) imageView {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)imageView.superview];
    DetailsViewController* dVc = [[DetailsViewController alloc] init];
    dVc.image = imageView.image;
    dVc.imageUrl = [self.imageItems objectAtIndex:indexPath.row].imageUrl.absoluteString;
    
    [self.navigationController pushViewController:dVc animated:YES];
}


@end


















