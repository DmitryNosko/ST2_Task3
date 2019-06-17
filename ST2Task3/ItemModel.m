//
//  ItemModel.m
//  ST2Task3
//
//  Created by Dima on 6/15/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "ItemModel.h"

static NSString* imageStr1 = @"https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Yandex.svg/1200px-Yandex.svg.png";
static NSString* imageStr2 = @"https://www.iguides.ru/upload/medialibrary/1f1/1f16df65301c8f2124a2a6395463dcba.jpg";
static NSString* imageStr3 = @"https://cs6.pikabu.ru/post_img/big/2017/06/06/11/1496774792184278033.png";
static NSString* imageStr4 = @"https://bipbap.ru/wp-content/uploads/2017/10/0_8eb56_842bba74_XL-640x400.jpg";
static NSString* imageStr5 = @"http://komotoz.ru/kartinki/images/kartinki_pro_lubov/kartinki_pro_lubov_17.jpg";
static NSString* imageStr6 = @"https://cdn.humoraf.ru/wp-content/uploads/2017/08/23-14.jpg";
static NSString* imageStr7 = @"http://mirpozitiva.ru/uploads/posts/2016-09/medium/1474011210_15.jpg";
static NSString* imageStr8 = @"http://bm.img.com.ua/img/prikol/images/large/0/0/307600.jpg";
static NSString* imageStr9 = @"http://fentezi-mir.ru/images/1/angel_326.jpg";
static NSString* imageStr10 = @"http://pikchyriki.net/avatar/krutye/100/38.jpg";

@implementation ItemModel

- (instancetype)initWith:(NSString*)name imageString:(NSString*) image
{
    self = [super init];
    if (self) {
        _nameString = name;
        _urlString = image;
    }
    return self;
}

- (NSArray<ItemModel*>*) makeItems {
    return (NSArray*)@[[[ItemModel alloc] initWith:@"str1" imageString:imageStr1],
                       [[ItemModel alloc] initWith:@"str2" imageString:imageStr2],
                       [[ItemModel alloc] initWith:@"str3" imageString:imageStr3],
                       [[ItemModel alloc] initWith:@"str4" imageString:imageStr4],
                       [[ItemModel alloc] initWith:@"str5" imageString:imageStr5],
                       [[ItemModel alloc] initWith:@"str6" imageString:imageStr6],
                       [[ItemModel alloc] initWith:@"str7" imageString:imageStr7],
                       [[ItemModel alloc] initWith:@"str8" imageString:imageStr8],
                       [[ItemModel alloc] initWith:@"str9" imageString:imageStr9],
                       [[ItemModel alloc] initWith:@"str10" imageString:imageStr10]
                       ];
}

@end
