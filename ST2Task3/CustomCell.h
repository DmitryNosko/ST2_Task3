//
//  CustomCell.h
//  ST2Task3
//
//  Created by Dima on 6/18/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomCell;

@protocol CustomCellListener <NSObject>
- (void) didTapOnImage:(UIImageView*) imageView;
@end

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) id<CustomCellListener> listener;

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel* infoLabel;

- (void) setInfo:(NSString*) info;
@end
