//
//  ZanAndShareView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/13.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "BaseView.h"

typedef void(^CoustomBlock)(UIButton *sender);

@interface ZanAndShareView : BaseView

@property (nonatomic, strong)UIButton *zanBtn;
@property (nonatomic, strong)UIButton *shareBtn;
@property (nonatomic, copy)NSString *shareUrl;

@property (nonatomic, strong)CoustomBlock coustomBlock;

@end
