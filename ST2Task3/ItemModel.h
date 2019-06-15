//
//  ItemModel.h
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property (strong, nonatomic) NSString* imageString;
@property (strong, nonatomic) NSString* nameString;

- (NSArray<ItemModel*>*) makeItems;
- (instancetype)initWith:(NSString*)name imageString:(NSString*) image;
@end
