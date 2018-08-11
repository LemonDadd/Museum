//
//  HomeViewTopCell.m
//  Museum
//
//  Created by 关云秀 on 2017/11/29.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewTopCell.h"
#import "SlideshowListModel.h"

@implementation HomeViewTopCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _sdcycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:BigDefault]];
        _sdcycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _sdcycleScrollView.currentPageDotColor = kColorWithHex(MCOLOR);
        _sdcycleScrollView.pageDotColor =[UIColor whiteColor];
        _sdcycleScrollView.localizationImageNamesGroup =@[@"矩形1",@"矩形1",@"矩形1"];
        [self.contentView addSubview:_sdcycleScrollView];
        [_sdcycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.mas_equalTo(kHeight(240));
            make.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}


-(void)setSdcycleImages:(NSArray *)array {
    NSMutableArray *imgs = [NSMutableArray array];
    for (SlideshowListModel *model in array) {
        [imgs addObject:model.img];
    }
    [_sdcycleScrollView setImageURLStringsGroup:imgs];
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

@end
