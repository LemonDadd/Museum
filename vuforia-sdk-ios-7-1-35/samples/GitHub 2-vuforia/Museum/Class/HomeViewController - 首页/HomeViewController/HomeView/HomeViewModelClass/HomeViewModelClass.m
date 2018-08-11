//
//  HomeViewModelClass.m
//  Museum
//
//  Created by 关云秀 on 2017/12/17.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewModelClass.h"


@implementation HomeViewModelClass


- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestHomerequest:(void(^)(NSString *errorMsg))request {
    [AllInterfaceRequest requestHomeByrequest:^(HomeModel *message, BOOL success, NSString *errorMsg, BOOL error) {
        if (success && !error) {
            self.SlideshowList = message.slideshowList;
            self.activityResource = message.activityList;
            self.mingxingRes = message.commentaryList;
             request(nil);
        }else {
             request(errorMsg);
        }
    }];
}


//===============
//
//NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"意大利陶瓷艺术",@"title",@"huodong_01.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"意大利陶瓷艺术",@"title",@"huodong_02.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"傅山书画艺术展",@"title",@"huodong_03.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"山西佛教艺术展",@"title",@"huodong_04.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"山西金代戏曲艺术展",@"title",@"huodong_05.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"晋国文物精华展",@"title",@"huodong_06.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//
//
//
//
//NSArray *arr = @[dic,dic1,dic2,dic3,dic4,dic5];
//
//_activityResource = [NSMutableArray array];
//for (id dit in arr) {
//    ActivityModel *model = [ActivityModel mj_objectWithKeyValues:dit];
//    [_activityResource addObject:model];
//}
//}
//return self;
//}
//
//- (void) addMingxng {
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"陶塑(永恒的象征)\n      ——乌尔巴尼亚",@"title",@"mxsww_01_img.png",@"image", nil];
//    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"瓶\n      ——佛罗伦萨",@"title",@"mxsww_02_img.png",@"image", nil];
//    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"乐技执壶\n      ——法恩莎",@"title",@"mxsww_03_img.png",@"image", nil];
//    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"文殊菩萨像\n      ——法恩莎",@"title",@"mxsww_04.png",@"image", nil];
//    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"泗州大圣像\n      ——法恩莎",@"title",@"mxsww_05.png",@"image", nil];
//    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"陶匜\n      ——法恩莎",@"title",@"mxsww_07.png",@"image", nil];
//
//
//
//
//    NSArray *arr = @[dic,dic1,dic2,dic3,dic4,dic5,dic,dic1,dic2,dic3,dic4,dic5];
//    [_activityResource removeAllObjects];
//    for (id dit in arr) {
//        ActivityModel *model = [ActivityModel mj_objectWithKeyValues:dit];
//        [_activityResource addObject:model];
//    }
//}
//
//- (void)addShoucang {
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"黄釉陶狗",@"title",@"shoucang.png",@"image",@"太原市博物馆",@"didian", nil];
//    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"北宋景德镇窑青白釉注碗",@"title",@"shoucang02.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"大汶口文化黑陶",@"title",@"shoucang03.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"唐彩绘彩色釉陶骑马女陶俑",@"title",@"shoucang04.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"五代白釉镂雕殿宇人物枕",@"title",@"shoucang05.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//
//
//
//
//    NSArray *arr = @[dic,dic1,dic2,dic3,dic4,dic1,dic2,dic3,dic4,dic1,dic2,dic3,dic4];
//    [_activityResource removeAllObjects];
//    for (id dit in arr) {
//        ActivityModel *model = [ActivityModel mj_objectWithKeyValues:dit];
//        [_activityResource addObject:model];
//    }
//}
//
//- (void)addVideo {
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"气候变化与文明的兴衰",@"title",@"shipin01_img",@"image",@"太原市博物馆",@"didian", nil];
//    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"古巴比伦空中花园",@"title",@"shipin02_img.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"虚游科尔沙巴德-亚述人的城市",@"title",@"shipin03_img.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"江西地区文化考察",@"title",@"shipin04_img.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"气候变化与文明的兴衰",@"title",@"shipin05_img.png",@"image",@"李娜",@"zhuchiren",@"2017.08.09-2017.09.20",@"date",@"太原市博物馆",@"didian",@"90人",@"baoMing",@"80人",@"yibaoming", nil];
//
//
//
//
//    NSArray *arr = @[dic,dic1,dic2,dic3,dic4,dic1,dic2,dic3,dic4,dic1,dic2,dic3,dic4];
//    [_activityResource removeAllObjects];
//    for (id dit in arr) {
//        ActivityModel *model = [ActivityModel mj_objectWithKeyValues:dit];
//        [_activityResource addObject:model];
//    }
//}
@end
