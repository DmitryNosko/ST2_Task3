//
//  ImageDataSource.h
//  ST2Task3
//
//  Created by Dima on 6/18/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageItem.h"

@interface ImageDataSource : NSObject

- (NSArray<ImageItem*>*) getAllImageItems;

@end
