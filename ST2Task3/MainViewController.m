//
//  MainViewController.m
//  ST2Task3
//
//  Created by Dima on 6/14/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "MainViewController.h"
#import "CustomTableViewCell.h"
#import "DetailsViewController.h"
#import "ItemModel.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, CustomTableViewCellListener>

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
    
    self.tableView.rowHeight = 200;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Images library";
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    ItemModel* model = [[ItemModel alloc] initWith:@"" imageString:@""];
    self.itemsArray = [model makeItems];
    
    NSCache<id, id>* cache = [[NSCache alloc] init];
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
    
    CustomTableViewCell* cell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.listener = self;
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ItemModel* item = self.itemsArray[indexPath.row];
    NSURL* url = [NSURL URLWithString:item.urlString];
    
    if ([self.cache objectForKey:item.nameString]) {
        cell.imgView.image = [self.cache objectForKey:item.nameString];
        cell.infoLabel.text = item.urlString;
    } else {
    
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage* image = [UIImage imageWithData:data];
                cell.imgView.image = image;
                [cell setInfo:item.urlString];
                [self.cache setObject:[UIImage imageWithData:data] forKey:item.nameString];
                
                NSDictionary* dictionary = [NSDictionary dictionaryWithObject:image forKey:item.urlString];
                [[NSNotificationCenter defaultCenter] postNotificationName:MainViewControllerImageWasLoadNotification
                                                                    object:nil
                                                                  userInfo:dictionary];
            });
        });
    }
        
    return cell;
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


















