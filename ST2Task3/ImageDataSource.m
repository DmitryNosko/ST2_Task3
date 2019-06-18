//
//  ImageDataSource.m
//  ST2Task3
//
//  Created by Dima on 6/18/19.
//  Copyright © 2019 Dima. All rights reserved.
//

#import "ImageDataSource.h"

static NSString* imageStr1 = @"https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Yandex.svg/1200px-Yandex.svg.png";
static NSString* imageStr2 = @"https://wallpaperplay.com/walls/full/1/3/d/15255.jpg";
static NSString* imageStr3 = @"https://cs6.pikabu.ru/post_img/big/2017/06/06/11/1496774792184278033.png";
static NSString* imageStr4 = @"https://bipbap.ru/wp-content/uploads/2017/10/0_8eb56_842bba74_XL-640x400.jpg";
static NSString* imageStr5 = @"http://komotoz.ru/kartinki/images/kartinki_pro_lubov/kartinki_pro_lubov_17.jpg";
static NSString* imageStr6 = @"https://cdn.humoraf.ru/wp-content/uploads/2017/08/23-14.jpg";
static NSString* imageStr7 = @"http://mirpozitiva.ru/uploads/posts/2016-09/medium/1474011210_15.jpg";
static NSString* imageStr8 = @"http://bm.img.com.ua/img/prikol/images/large/0/0/307600.jpg";
static NSString* imageStr9 = @"http://fentezi-mir.ru/images/1/angel_326.jpg";
static NSString* imageStr10 = @"http://proxy11.media.online.ua/uol/r3-4f7252f686/562ac55565b72.jpg";
static NSString* imageStr11 = @"https://i.pinimg.com/originals/33/95/c1/3395c1e68ad40df076995120ce097fab.png";
static NSString* imageStr12 = @"https://islam-today.ru/files/news/part_9/96929/396855-INNERRESIZED600-600-path-3321410_960_720.jpg";
static NSString* imageStr13 = @"https://i.pinimg.com/originals/43/af/34/43af347e2c56b0ac9dd3c53cfcbddeae.jpg";
static NSString* imageStr14 = @"http://bogoblog.ru/wp-content/uploads/2014/08/aaron-burden-304587-825x510.jpg";
static NSString* imageStr15 = @"https://66.media.tumblr.com/003236db44281e3899e2a374825fa347/tumblr_p5ka8kBUIA1x39oh3o3_640.jpg";
static NSString* imageStr16 = @"https://i.pinimg.com/originals/ce/d4/6d/ced46de5aff2a1640caff0333b3c4313.jpg";
static NSString* imageStr17 = @"https://66.media.tumblr.com/661b8f45d04cff45843d9efed9dc7f2e/tumblr_p5ka8kBUIA1x39oh3o1_400.jpg";
static NSString* imageStr18 = @"https://66.media.tumblr.com/c53c8c27a2221c229614d99b2e824b52/tumblr_pc28yegFdc1xq5po1o2_400.jpg";
static NSString* imageStr19 = @"https://a.wattpad.com/cover/138836486-352-k718803.jpg";
static NSString* imageStr20 = @"https://66.media.tumblr.com/0b262869fee1c90f4acba6fdd45d7fb8/tumblr_p4nsfysIck1x0pghho4_400.jpg";
static NSString* imageStr21 = @"https://sticker-jam.ru/wp-content/uploads/2017/02/naklejki-tumblr-1.jpg";
static NSString* imageStr22 = @"https://image.winudf.com/v2/image/Y29tLlR1bWJsci5RdW90ZXNfc2NyZWVuXzNfMTUyNTQyMjI0NV8wNzU/screen-3.jpg?fakeurl=1&type=.jpg";
static NSString* imageStr23 = @"https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ec/92/1a/ec921a18-d10d-b627-490f-70f1eebec6cb/pr_source.png/300x0w.jpg";
static NSString* imageStr24 = @"https://bipbap.ru/wp-content/uploads/2017/06/8100747bd5c9a4c3ee36bd8144ca42b4.jpg";
static NSString* imageStr25 = @"https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/6f/d5/18/6fd51826-80a3-5692-3faf-e93c5f85184f/pr_source.png/300x0w.jpg";
static NSString* imageStr26 = @"https://i.pinimg.com/736x/91/7a/ef/917aef29fa3317efe1e50ae67ca179c4.jpg";
static NSString* imageStr27 = @"https://image.winudf.com/v2/image/Y29tLlR1bWJsci5RdW90ZXNfc2NyZWVuXzBfMTUyNTQyMjI0NF8wODQ/screen-0.jpg?fakeurl=1&type=.jpg";
static NSString* imageStr28 = @"https://66.media.tumblr.com/bcc8d35c04e2da6bbc8fe273ad2b1f1a/tumblr_pn1em80bfB1si9yqg_1280.png";
static NSString* imageStr29 = @"https://i.ytimg.com/vi/6KUYZTPjWu0/maxresdefault.jpg";
static NSString* imageStr30 = @"https://66.media.tumblr.com/cc4843dc7bf188b769ccc40da9646aa1/tumblr_pn1em4zMZu1si9yqg_1280.png";
static NSString* imageStr31 = @"http://lamcdn.net/lookatme.ru/post-cover/2DYr8WuG6-K8Ym9gPHYyDA-default.png";
static NSString* imageStr32 = @"http://lamcdn.net/lookatme.ru/post-cover/9UAybiAkgl0REyGRa1omwg-default.jpg";
static NSString* imageStr33 = @"https://img.youtube.com/vi/N7H1934oxfI/maxresdefault.jpg";
static NSString* imageStr34 = @"http://www.ie-wallpapers.com/data/out/228/37824835-tumblr-pics.jpg";
static NSString* imageStr35 = @"http://n.sinaimg.cn/tech/transform/184/w630h354/20181214/iQY3-hqackac4470393.jpg";
static NSString* imageStr36 = @"https://cdn.vox-cdn.com/thumbor/SsCZr8dipPHJJhryzkTlVU1mxHk=/0x0:2040x1360/1200x800/filters:focal(883x579:1209x905)/cdn.vox-cdn.com/uploads/chorus_image/image/63192384/akrales_180614_1777_0080.0.jpg";
static NSString* imageStr37 = @"https://i.pinimg.com/originals/96/6f/39/966f39480ef0dbc0f914d317fc378bb6.jpg";
static NSString* imageStr38 = @"https://i.pinimg.com/736x/2a/c1/f1/2ac1f1fa12eeeb92b1468ece25aac8a1.jpg";
static NSString* imageStr39 = @"https://avante.biz/wp-content/uploads/Galaxy-Wallpaper-Tumblr/Galaxy-Wallpaper-Tumblr-001.jpg";
static NSString* imageStr40 = @"https://i.pinimg.com/736x/ef/4d/5e/ef4d5e7cdddfc4659ab58c77c7d0a89c.jpg";
static NSString* imageStr41 = @"http://sfwallpaper.com/images/galaxy-wallpaper-tumblr-11.jpg";
static NSString* imageStr42 = @"https://cdn.pixabay.com/photo/2018/05/24/11/15/landscape-3426391_960_720.jpg";
static NSString* imageStr43 = @"https://www.culture.ru/storage/images/c3362c5c392917df91398b350667666d/36b1ae8b8e183acb9ed74f785303b7f2.png";
static NSString* imageStr44 = @"https://www.mobi-city.ru/wallpaper/image/nature_20_240x320.jpg";
static NSString* imageStr45 = @"https://i.ytimg.com/vi/iUfmNw0ZA8w/maxresdefault.jpg";
static NSString* imageStr46 = @"http://katyaburg.ru/sites/default/files/pictures/krasota_prirody/priroda_kartinki_foto_04.jpg";
static NSString* imageStr47 = @"https://icocnews.ru/wp-content/uploads/2015/09/priroda.jpg";
static NSString* imageStr48 = @"https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Hopetoun_falls.jpg/220px-Hopetoun_falls.jpg";
static NSString* imageStr49 = @"http://7oom.ru/img/thumb/foto-priroda-46.jpg";
static NSString* imageStr50 = @"http://72tv.ru/uploads/posts/2018-08/1534140208_korovki-krasivye.jpg";
static NSString* imageStr51 = @"https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Disambigua_compass.svg/200px-Disambigua_compass.svg.png";
static NSString* imageStr52 = @"http://img.over-blog-kiwi.com/1/84/06/72/20160215/ob_74762f_nfvbmns.png";
static NSString* imageStr53 = @"https://st.depositphotos.com/1005145/2341/i/450/depositphotos_23418410-stock-photo-pink-flowers-in-the-mountains.jpg";
static NSString* imageStr54 = @"http://www.vseznaika.org/wp-content/uploads/2016/03/pic-00892.jpg";
static NSString* imageStr55 = @"https://mobimg.b-cdn.net/pic/v2/gallery/preview/cvety-gory-pejzazh-priroda-rasteniya-41477.jpg";
static NSString* imageStr56 = @"https://sites.google.com/site/prirodanasevseegooglgfgf/_/rsrc/1463456237313/home/priroda_gory_nebo_ozero_oblaka_81150_1920x1080.jpg";
static NSString* imageStr57 = @"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Nota_disambigua.svg/240px-Nota_disambigua.svg.png";
static NSString* imageStr58 = @"https://kipmu.ru/wp-content/uploads/sam_op_jiv_ros.jpg";
static NSString* imageStr59 = @"https://images11.popmeh.ru/upload/img_cache/a8d/a8df7adebed271b6bfc4468b202bb372_ce_900x600x0x0_cropped_800x427.jpg";
static NSString* imageStr60 = @"http://hdqwalls.com/wallpapers/3d-cube-background-4k-yo.jpg";

@implementation ImageDataSource

- (NSArray<ImageItem*>*) getAllImageItems {
    return (NSArray*)@[[[ImageItem alloc] initWith:imageStr1],
                       [[ImageItem alloc] initWith:imageStr2],
                       [[ImageItem alloc] initWith:imageStr3],
                       [[ImageItem alloc] initWith:imageStr4],
                       [[ImageItem alloc] initWith:imageStr5],
                       [[ImageItem alloc] initWith:imageStr6],
                       [[ImageItem alloc] initWith:imageStr7],
                       [[ImageItem alloc] initWith:imageStr8],
                       [[ImageItem alloc] initWith:imageStr9],
                       [[ImageItem alloc] initWith:imageStr10],
                       [[ImageItem alloc] initWith:imageStr11],
                       [[ImageItem alloc] initWith:imageStr12],
                       [[ImageItem alloc] initWith:imageStr13],
                       [[ImageItem alloc] initWith:imageStr14],
                       [[ImageItem alloc] initWith:imageStr15],
                       [[ImageItem alloc] initWith:imageStr16],
                       [[ImageItem alloc] initWith:imageStr17],
                       [[ImageItem alloc] initWith:imageStr18],
                       [[ImageItem alloc] initWith:imageStr19],
                       [[ImageItem alloc] initWith:imageStr20],
                       [[ImageItem alloc] initWith:imageStr21],
                       [[ImageItem alloc] initWith:imageStr22],
                       [[ImageItem alloc] initWith:imageStr23],
                       [[ImageItem alloc] initWith:imageStr24],
                       [[ImageItem alloc] initWith:imageStr25],
                       [[ImageItem alloc] initWith:imageStr26],
                       [[ImageItem alloc] initWith:imageStr27],
                       [[ImageItem alloc] initWith:imageStr28],
                       [[ImageItem alloc] initWith:imageStr29],
                       [[ImageItem alloc] initWith:imageStr30],
                       [[ImageItem alloc] initWith:imageStr31],
                       [[ImageItem alloc] initWith:imageStr32],
                       [[ImageItem alloc] initWith:imageStr33],
                       [[ImageItem alloc] initWith:imageStr34],
                       [[ImageItem alloc] initWith:imageStr35],
                       [[ImageItem alloc] initWith:imageStr36],
                       [[ImageItem alloc] initWith:imageStr37],
                       [[ImageItem alloc] initWith:imageStr38],
                       [[ImageItem alloc] initWith:imageStr39],
                       [[ImageItem alloc] initWith:imageStr40],
                       [[ImageItem alloc] initWith:imageStr41],
                       [[ImageItem alloc] initWith:imageStr42],
                       [[ImageItem alloc] initWith:imageStr43],
                       [[ImageItem alloc] initWith:imageStr44],
                       [[ImageItem alloc] initWith:imageStr45],
                       [[ImageItem alloc] initWith:imageStr46],
                       [[ImageItem alloc] initWith:imageStr47],
                       [[ImageItem alloc] initWith:imageStr48],
                       [[ImageItem alloc] initWith:imageStr49],
                       [[ImageItem alloc] initWith:imageStr50],
                       [[ImageItem alloc] initWith:imageStr51],
                       [[ImageItem alloc] initWith:imageStr52],
                       [[ImageItem alloc] initWith:imageStr53],
                       [[ImageItem alloc] initWith:imageStr54],
                       [[ImageItem alloc] initWith:imageStr55],
                       [[ImageItem alloc] initWith:imageStr56],
                       [[ImageItem alloc] initWith:imageStr57],
                       [[ImageItem alloc] initWith:imageStr58],
                       [[ImageItem alloc] initWith:imageStr59],
                       [[ImageItem alloc] initWith:imageStr60]
                       ];
}

@end






































