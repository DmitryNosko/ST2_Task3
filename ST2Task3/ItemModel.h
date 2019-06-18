//
//  ItemModel.h
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ItemModel : NSObject

@property (strong, nonatomic) NSString* urlString;
@property (strong, nonatomic) NSString* currentInfo;
@property (strong, nonatomic) UIImage* image;

- (NSArray<ItemModel*>*) makeItems;
- (instancetype)initWith:(NSString*) image;
@end
