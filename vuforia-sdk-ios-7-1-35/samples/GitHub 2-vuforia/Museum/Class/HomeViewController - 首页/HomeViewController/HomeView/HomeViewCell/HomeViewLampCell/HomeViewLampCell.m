//
//  HomeViewLampCell.m
//  Museum
//
//  Created by 关云秀 on 2017/11/30.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "HomeViewLampCell.h"
#import "CommentaryModel.h"

@implementation HomeViewLampCell

static int countInt = 0;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _bgView = [UIView new];
        [self.contentView addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.equalTo(@60);
            make.bottom.equalTo(self.contentView);
        }];
        
        UIImage *lbImage = [UIImage imageNamed:@"home_lb_icon"];
        _leftImageView = [UIImageView new];
        _leftImageView.image =lbImage;
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(lbImage.size);
        }];
        
        
        UIImage *rightImage = [UIImage imageNamed:@"home_right_arr"];
        _rightImageView = [UIImageView new];
        _rightImageView.image =rightImage;
        [self.contentView addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(rightImage.size);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont fontWithName:MFONT size:14];
        _titleLabel.textColor = kColorWithHex(0x8a8a8a);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftImageView.mas_right).offset(10);
            make.centerY.equalTo(_leftImageView);
            make.right.equalTo(_rightImageView.mas_left).offset(-10);
        }];
        
    }
    return self;
}

-(void)setAllResource:(NSArray *)allResource {
    _allResource = allResource;
    
    if (_allResource.count == 0) {
        return;
    }
    TT_INVALIDATE_TIMER(_timer);
    _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    
    if (countInt < _allResource.count) {
        CommentaryModel *model =_allResource[countInt];
        _titleLabel.text =[NSString stringWithFormat:@"%@",model.name];
        countInt = 0;
    }
    
}

- (void)displayNews {
    countInt++;
    if (_allResource != nil && _allResource.count > 0) {
        if (countInt >= [_allResource count]) {
            countInt=0;
        }
        CATransition *animation = [CATransition animation];
        animation.duration = 0.5f ;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = YES;
        animation.type = @"cube";
        [_titleLabel.layer addAnimation:animation forKey:@"animationID"];
        CommentaryModel *model =_allResource[countInt];
        _titleLabel.text =model.name;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
