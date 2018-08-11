//
//  CollectionDetailsView+KnowledgeView.h
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsView.h"

@interface CollectionDetailsView (KnowledgeView)

@property (nonatomic, strong)UIView *knowledgeView;

- (void)showKnowledgeView:(BOOL)isKnowledgeView;

@end
