//
//  ItemModel.m
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "ImageItem.h"

@implementation ImageItem

- (instancetype)initWith:(NSString*) imageAbsoluteUrl
{
    self = [super init];
    if (self) {
        _imageUrl = [NSURL URLWithString:imageAbsoluteUrl];
    }
    return self;
}


@end
