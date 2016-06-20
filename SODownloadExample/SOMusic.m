//
//  SOMusic.m
//  SODownloadExample
//
//  Created by xueyi on 16/5/3.
//  Copyright © 2016年 http://scfhao.coding.me. All rights reserved.
//

#import "SOMusic.h"
#import "SODownloader.h"

@implementation SOMusic

+ (NSArray *)allMusicList {
    return @[
        [SOMusic musicWithTitle:@"AiMei"],
        [SOMusic musicWithTitle:@"BaiNianGuJi"],
        [SOMusic musicWithTitle:@"BuAiWoDeWoBuAi"],
        [SOMusic musicWithTitle:@"BuLiu"],
        [SOMusic musicWithTitle:@"ChuanQi"],
        [SOMusic musicWithTitle:@"CuiMian"],
        [SOMusic musicWithTitle:@"DiDar"],
        [SOMusic musicWithTitle:@"HuDie"],
        [SOMusic musicWithTitle:@"HuaShiLiao"],
        [SOMusic musicWithTitle:@"LiuNian"],
        [SOMusic musicWithTitle:@"Meng"],
        [SOMusic musicWithTitle:@"MiHongJi"],
        [SOMusic musicWithTitle:@"NaXieHuaEr"],
        [SOMusic musicWithTitle:@"QiZi"],
        [SOMusic musicWithTitle:@"RenJian"],
        [SOMusic musicWithTitle:@"RongYiShouShangDeNvRen"],
        [SOMusic musicWithTitle:@"ShiYan"],
        [SOMusic musicWithTitle:@"TianYuDi"],
        [SOMusic musicWithTitle:@"XiaoWangShu"],
        [SOMusic musicWithTitle:@"XuanMu"]
    ];
}

+ (instancetype)musicWithTitle:(NSString *)title {
    return [[self alloc]initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (NSString *)downloadURL {
    return [NSString stringWithFormat:@"http://o6lpg3g95.bkt.clouddn.com/%@.mp3", self.title];
}

- (void)download {
    [[SODownloader sharedDownloader]downloadFileFromURLString:[self downloadURL] priority:SODownloadPriorityNormal progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@--%.1f", self.title, downloadProgress.fractionCompleted);
    } destination:nil success:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath) {
        NSLog(@"%@--下载完成", self.title);
    } failure:^(NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@--下载失败:%@", self.title, error);
    }];
}

- (NSUInteger)hash {
    return [self.title hash];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[SOMusic class]]) {
        NSString *otherTitle = [(SOMusic *)object title];
        return [self.title isEqualToString:otherTitle];
    }
    return NO;
}

@end