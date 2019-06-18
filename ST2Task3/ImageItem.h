//
//  ItemModel.h
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageItem : NSObject

@property (strong, nonatomic) NSURL* imageUrl;
@property (strong, nonatomic) UIImage* image;

- (instancetype)initWith:(NSString*) imageAbsoluteUrl;

@end
