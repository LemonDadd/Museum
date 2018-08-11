
//
//  MineView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/7.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "MineView.h"
#import "MineViewTabViewCell.h"
#import "MineViewTopTabViewCell.h"
#import "MyFavoriteController.h"
#import "SystemSettingController.h"
#import "AppointmentViewController.h"
#import "MyActivityViewController.h"
#import "SelectPhotoManager.h"
#import "AboutViewController.h"

@interface MineView()

@property (nonatomic, strong)SelectPhotoManager *photoManager;

@end

@implementation MineView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _modelClass = [MineViewModelClass new];
        _mainTableView = [[BaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        _mainTableView.backgroundColor = [UIColor whiteColor];//0xf9f9f9
        [_mainTableView setSeparatorColor:kColorWithHex(LINECOLOR)];
        [self addSubview:_mainTableView];
        [self setExtraCellLineHidden:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            
        }
        
//        _imageArray = @[@[@"my_buy_icon",@"my_yuyue_icon",@"my_love_icon",@"my_active_icon"],@[@"my_set_icon",@"my_delete_icon"],@[@"my_about_icon",@"my_phone_icon"]];
//        _titleArray =@[@[@"我的购买",@"我的预约",@"我的收藏",@"我的活动"],@[@"系统设置",@"清除缓存"],@[@"关于我们",@"服务咨询"]];
        _imageArray = @[@[@"my_yuyue_icon",@"my_love_icon",@"my_active_icon"],@[@"my_set_icon",@"my_delete_icon"],@[@"my_about_icon",@"my_phone_icon"]];
        _titleArray =@[@[@"我的预约",@"我的收藏",@"我的活动"],@[@"系统设置",@"清除缓存"],@[@"关于我们",@"服务咨询"]];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==0) {
        return 1;
    } else if (section ==1) {
        return 3;
    } else {
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MineViewTopTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineViewTopTabViewCell"];
        if (cell == nil) {
            cell = [[MineViewTopTabViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MineViewTopTabViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerImageViewEvent:)];
        [cell.headerImageView addGestureRecognizer:gr];
        if ([UserInfoClass getUserInfoClass] == nil) {
            cell.headerImageView.image = [UIImage imageNamed:@"icon_logo"];
            cell.nameLabel.text = @"请点击登录";
        } else {
            [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PhotoBase,[UserInfoClass getUserInfoClass].photo]] placeholderImage:[UIImage imageNamed:@"icon_logo"]];
            cell.nameLabel.text =[UserInfoClass getUserInfoClass].username;
        }
        
        
        
        return cell;
    } else {
        MineViewTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineViewTabViewCell"];
        if (cell == nil) {
            cell = [[MineViewTabViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MineViewTabViewCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        NSArray *title = _titleArray[indexPath.section-1];
        NSArray *image = _imageArray[indexPath.section-1];
        
        cell.leftImageView.image = [UIImage imageNamed:image[indexPath.row]];
        cell.titleLabel.text = title[indexPath.row];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 5.f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section ==0) {
        return nil;
    } else {
        UIView *view = [UIView new];
        view.backgroundColor = kColorWithHex(0xf9f9f9);
        return view;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        //清除缓存
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"缓存大小为%@,确定要清理缓存吗？",[self getCache]] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [[SDImageCache sharedImageCache]clearMemory];
            [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
        }];
        
        // Add the actions.
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        
        
        [self.viewController presentViewController:alertController animated:YES completion:nil];

        return;
    }
    
    if (indexPath.section ==3 && indexPath.row ==0) {
        //关于我们
        AboutViewController *vc = [AboutViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    
    if ([UserInfoClass getUserInfoClass] ==nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
        return;
    }
    if (indexPath.section == 1) {
//        if (indexPath.row ==0) {
//            //我的购买
//        } else 
        if (indexPath.row == 0) {
            //我的预约
            AppointmentViewController *vc = [AppointmentViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1) {
            //我的收藏
            MyFavoriteController *vc =[MyFavoriteController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 2) {
            MyActivityViewController *vc = [MyActivityViewController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row ==0) {
            //系统设置
            SystemSettingController *vc =[SystemSettingController new];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 1) {
            //服务咨询
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"服务咨询" message:@"拨打电话 0351-4222173" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
            }];
            
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://0351-4222173"]];
            }];
            
            // Add the actions.
            [alertController addAction:cancelAction];
            [alertController addAction:otherAction];
            
            
            [self.viewController presentViewController:alertController animated:YES completion:nil];
        }
    }
}

- (void)headerImageViewEvent:(UITapGestureRecognizer *)gr {
    if ([UserInfoClass getUserInfoClass] ==nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
        return;
    }
    
    if (!_photoManager) {
        _photoManager =[[SelectPhotoManager alloc]init];
    }
    [_photoManager startSelectPhotoWithImageName:@"选择头像" sender:gr.view];
    kWeakSelf(self);
    //选取照片成功
    _photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image){
        //保存到本地
        [weakself uploadImage:image];
    };
}

- (void)uploadImage:(UIImage *)img {
    [[CustomView getInstancetype]showWaitView:@"正在上传..." byView:self];
    [self.modelClass updatePhotoImagesByImags:img Request:^(NSString *errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (errorMsg == nil) {
            [UserInfoClass saveUserHeadImagePath:_modelClass.photoStr];
            [_mainTableView reloadData];
        }else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

- (NSString *)getCache {
    unsigned long long size = [SDImageCache sharedImageCache].getSize;
    //fileSize是封装在Category中的。
    
   //CustomFile + SDWebImage 缓存
    
    //设置文件大小格式
    NSString *sizeText = nil;
    if (size >= pow(10, 9)) {
        sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
    }else if (size >= pow(10, 6)) {
        sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
    }else if (size >= pow(10, 3)) {
        sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
    }else {
        sizeText = [NSString stringWithFormat:@"%lluB", size];
    }
    return sizeText;
}

@end










