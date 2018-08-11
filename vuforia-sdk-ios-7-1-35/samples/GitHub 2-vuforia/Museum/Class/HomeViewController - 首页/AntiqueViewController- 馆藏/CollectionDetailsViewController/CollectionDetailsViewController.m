//
//  CollectionDetailsViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/5.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionDetailsViewController.h"
#import "CollectionDetailsView.h"
#import "CollectionDetailsView+BottomFunctionView.h"

@interface CollectionDetailsViewController ()

@property (nonatomic, strong)CollectionDetailsView * collectionDetailsView;

@end

@implementation CollectionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =self.model.name;
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _collectionDetailsView = [[CollectionDetailsView alloc]initWithCollectionModel:self.model];
    [self.view addSubview:_collectionDetailsView];
    [_collectionDetailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)back {
    [_collectionDetailsView releasePlayerView];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc {
    [_collectionDetailsView releasePlayerView];
    TTVIEW_RELEASE_SAFELY(_collectionDetailsView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
