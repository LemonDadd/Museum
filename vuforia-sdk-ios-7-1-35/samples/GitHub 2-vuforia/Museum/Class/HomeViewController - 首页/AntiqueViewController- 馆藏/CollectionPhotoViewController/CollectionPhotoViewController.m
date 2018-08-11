//
//  CollectionPhotoViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/6.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "CollectionPhotoViewController.h"
#import "CollectionPhotoView.h"

@interface CollectionPhotoViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)CollectionPhotoView *collectionPhotoView;



@end

@implementation CollectionPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"馆藏细节";
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIImageView *bg = [UIImageView new];
    bg.userInteractionEnabled = YES;
    bg.image = [UIImage imageNamed:@"gc_xq_bg"];
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _collectionPhotoView = [CollectionPhotoView new];
    _collectionPhotoView.allResource = _photoList;
    [self.view addSubview:_collectionPhotoView];
    [_collectionPhotoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bg);
    }];
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
