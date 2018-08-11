//
//  MuseumViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/2.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MuseumViewController.h"
#import "MuseumView.h"

@interface MuseumViewController ()
@property (nonatomic, strong)MuseumView *museumView;

@end

@implementation MuseumViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:true];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _museumView = [[MuseumView alloc]initWithFrame:CGRectMake(0, 0, [DeviceInfo ScreenSize].width, [DeviceInfo ScreenSize].height)];
    [self.view addSubview:_museumView];
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
