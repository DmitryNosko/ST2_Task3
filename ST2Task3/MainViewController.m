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
#import "ItemModel.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, CustomCellListener>

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSArray<ItemModel*>* itemsArray;
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
    
    ItemModel* model = [[ItemModel alloc] initWith:@""];
    self.itemsArray = [model makeItems];
    
    NSCache* cache = [[NSCache alloc] init];
    self.cache = cache;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell* cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.listener = self;
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    ItemModel* item = self.itemsArray[indexPath.row];
    [cell.imgView setImage:[UIImage imageNamed:@"noPhoto"]];
    cell.infoLabel.text = item.urlString;
    

    if ([self.cache objectForKey:item.urlString]) {
        cell.imgView.image = [self.cache objectForKey:item.urlString];
    } else {

        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSURL* url = [NSURL URLWithString:item.urlString];
            NSData* data = [NSData dataWithContentsOfURL:url];
            UIImage* image = [UIImage imageWithData:data];
            item.image = image;
            item.currentInfo = item.urlString;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image != nil) {
                    cell.infoLabel.text = item.currentInfo;
                    [cell.imgView setImage:item.image];
                    [self.cache setObject:image forKey:item.urlString];
                    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:image forKey:item.urlString];
                    [[NSNotificationCenter defaultCenter] postNotificationName:MainViewControllerImageWasLoadNotification
                                                                        object:nil
                                                                        userInfo:dictionary];
                }

            });
        });
    }
    
    
    return cell;
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
    
    dVc.imageUrl = [self.itemsArray objectAtIndex:indexPath.row].urlString;
        
    [self.navigationController pushViewController:dVc animated:YES];
}


@end


















