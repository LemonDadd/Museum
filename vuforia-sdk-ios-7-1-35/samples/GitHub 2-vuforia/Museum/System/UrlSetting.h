//
//  UrlSetting.h
//  Museum
//
//  Created by 关云秀 on 2017/11/26.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#ifndef UrlSetting_h
#define UrlSetting_h

#ifndef Api_IP

//日志
#if EnvironmentalType == 2  //测试环境

#define Api_IP @"http://wunmest.com/museum/"

#else
#define Api_IP @"http://museum.sxsxjyjs.com:8061/museum/"
#endif

#endif

#define PhotoBase @"http://221.204.177.145:8061"
#define ArBase @"http://museum.sxsxjyjs.com:8061/museum_ar/main"
#

#define BaseUrl(api_IP, lastUrl) ([NSString stringWithFormat:@"%@%@", (api_IP), (lastUrl)])

//分享视频
#define ShareVideo(Id) ([NSString stringWithFormat:@"%@f/share/video/%@", (Api_IP), (Id)])
//分享活动
#define ShareActivity(Id) ([NSString stringWithFormat:@"%@f/share/activity/%@", (Api_IP), (Id)])
//分享馆藏
#define ShareCollection(Id) ([NSString stringWithFormat:@"%@f/share/collection/%@", (Api_IP), (Id)])
//分享展览
#define ShareExhibition(Id) ([NSString stringWithFormat:@"%@f/share/exhibition/%@", (Api_IP), (Id)])

/**
 *  发送验证码
 *
 *  @param Api_IP
 *  @param @"api/common/sendValidCode"
 *
 *  @return
 */
#define SendValidCodeBaseUrl BaseUrl(Api_IP, @"api/common/sendValidCode")

/**
 *  上传图片
 *
 *  @param Api_IP
 *  @param @"api/common/upload"
 *
 *  @return
 */
#define UploadBaseUrl BaseUrl(Api_IP, @"api/common/upload")

/**
 *  登录接口
 *
 *  @param Api_IP
 *  @param @"api/user/passwordLogin"
 *
 *  @return
 */
#define LoginBaseUrl BaseUrl(Api_IP, @"api/user/passwordLogin")

/**
 *  注册接口
 *
 *  @param Api_IP
 *  @param @"api/user/reg"
 *
 *  @return
 */
#define UserRegBaseUrl BaseUrl(Api_IP, @"api/user/reg")

/**
 *  重置密码接口
 *
 *  @param Api_IP
 *  @param @"api/user/resetPassword"
 *
 *  @return
 */
#define ResetPasswordBaseUrl BaseUrl(Api_IP, @"api/user/resetPassword")

/**
 *  修改绑定手机
 *
 *  @param Api_IP
 *  @param @"api/user/updateMobile"
 *
 *  @return
 */
#define UpdateMobileBaseUrl BaseUrl(Api_IP, @"api/user/updateMobile")

/**
 *  修改密码
 *
 *  @param Api_IP
 *  @param @"api/user/updatePassword"
 *
 *  @return
 */
#define UpdatePasswordBaseUrl BaseUrl(Api_IP, @"api/user/updatePassword")

/**
 *  修改头像
 *
 *  @param Api_IP
 *  @param @"api/user/updatePhoto"
 *
 *  @return
 */
#define UpdatePhotoBaseUrl BaseUrl(Api_IP, @"api/user/updatePhoto")

/**
 *  首页
 *
 *  @param Api_IP
 *  @param @"api/common/index"
 *
 *  @return
 */
#define CommonIndxBaseUrl BaseUrl(Api_IP, @"api/common/index")

/**
 *  轮播图
 *
 *  @param Api_IP
 *  @param @"api/slideshow/list"
 *
 *  @return
 */
#define SlideshowBaseUrl BaseUrl(Api_IP, @"api/slideshow/list")

/**
 *  活动列表
 *
 *  @param Api_IP
 *  @param @"api/activity"
 *
 *  @return
 */
#define ActivityBaseUrl BaseUrl(Api_IP, @"api/activity")

/**
 *  展览列表
 *
 *  @param Api_IP
 *  @param @"api/exhibition"
 *
 *  @return
 */
#define ExhibitionBaseUrl BaseUrl(Api_IP, @"api/exhibition")

/**
 *  博物馆信息
 *
 *  @param Api_IP
 *  @param @"api/museum"
 *
 *  @return
 */
#define MuseumBaseUrl BaseUrl(Api_IP, @"api/museum")

/**
 *  博物馆预约
 *
 *  @param Api_IP
 *  @param @"api/resvervation/add"
 *
 *  @return
 */
#define ResvervationAddBaseUrl BaseUrl(Api_IP, @"/api/resvervation/add")
/**
 *  我的预约
 *
 *  @param Api_IP
 *  @param @"api/resvervation/mine"
 *
 *  @return
 */
#define ResvervationMineBaseUrl BaseUrl(Api_IP, @"/api/resvervation/mine")

/**
 *  馆藏分类列表
 *
 *  @param Api_IP
 *  @param @"api/collection/category"
 *
 *  @return
 */
#define CollectionCategoryBaseUrl BaseUrl(Api_IP, @"api/collection/category")

/**
 *  馆藏分类下列表
 *
 *  @param Api_IP
 *  @param @"api/collection/findByCategory"
 *
 *  @return
 */
#define FindByCategoryBaseUrl BaseUrl(Api_IP, @"api/collection/findByCategory")

/**
 *  馆藏收藏
 *
 *  @param Api_IP
 *  @param @"api/collection/favor"
 *
 *  @return
 */
#define CollectionFavorBaseUrl BaseUrl(Api_IP, @"/api/collection/favor")

/**
 *  馆藏取消收藏
 *
 *  @param Api_IP
 *  @param @"api/collection/cancleFavor"
 *
 *  @return
 */
#define CollectionCancleFavorBaseUrl BaseUrl(Api_IP, @"/api/collection/cancleFavor")

/**
 *  我的收藏（藏品）
 *
 *  @param Api_IP
 *  @param @"api/collection/myFavor"
 *
 *  @return
 */
#define CollectionMyFavorBaseUrl BaseUrl(Api_IP, @"/api/collection/myFavor")

/**
 *  活动收藏
 *
 *  @param Api_IP
 *  @param @"api/activity/favor"
 *
 *  @return
 */
#define ActivityFavorBaseUrl BaseUrl(Api_IP, @"/api/activity/favor")

/**
 *  活动取消收藏
 *
 *  @param Api_IP
 *  @param @"api/activity/cancleFavor"
 *
 *  @return
 */
#define ActivityCancleFavorBaseUrl BaseUrl(Api_IP, @"/api/activity/cancleFavor")

/**
 *  活动预约
 *
 *  @param Api_IP
 *  @param @"/api/activity/participate"
 *
 *  @return
 */
#define ActivityParticipateBaseUrl BaseUrl(Api_IP, @"/api/activity/participate")

/**
 *  我的活动
 *
 *  @param Api_IP
 *  @param @"/api/activity/myActivity"
 *
 *  @return
 */
#define MyActivityBaseUrl BaseUrl(Api_IP, @"/api/activity/myActivity")


/**
 *  我的收藏(活动)
 *
 *  @param Api_IP
 *  @param @"api/activity/myFavor"
 *
 *  @return
 */
#define ActivityMyFavorBaseUrl BaseUrl(Api_IP, @"/api/activity/myFavor")

/**
 *  展览收藏
 *
 *  @param Api_IP
 *  @param @"api/exhibition/favor"
 *
 *  @return
 */
#define ExhibitionFavorBaseUrl BaseUrl(Api_IP, @"/api/exhibition/favor")

/**
 *  展览取消收藏
 *
 *  @param Api_IP
 *  @param @"api/exhibition/cancleFavor"
 *
 *  @return
 */
#define ExhibitionCancleFavorBaseUrl BaseUrl(Api_IP, @"/api/exhibition/cancleFavor")

/**
 *  我的收藏(展览)
 *
 *  @param Api_IP
 *  @param @"api/exhibition/myFavor"
 *
 *  @return
 */
#define ExhibitionMyFavorBaseUrl BaseUrl(Api_IP, @"/api/exhibition/myFavor")

/**
 *  视频列表
 *
 *  @param Api_IP
 *  @param @"/api/video"
 *
 *  @return
 */
#define VideoListBaseUrl BaseUrl(Api_IP, @"/api/video")

/**
 *  添加视频评论
 *
 *  @param Api_IP
 *  @param @"/api/video/addComment"
 *
 *  @return
 */
#define VideoAddCommentBaseUrl BaseUrl(Api_IP, @"/api/video/addComment")

/**
 *  视频评论列表
 *
 *  @param Api_IP
 *  @param @"/api/video/commentList"
 *
 *  @return
 */
#define VideoCommentListBaseUrl BaseUrl(Api_IP, @"/api/video/commentList")

/**
 *  视频取消点赞
 *
 *  @param Api_IP
 *  @param @"/api/video/cancleFavor"
 *
 *  @return
 */
#define VideoCancleFavorBaseUrl BaseUrl(Api_IP, @"/api/video/cancleFavor")

/**
 *  视频点赞
 *
 *  @param Api_IP
 *  @param @"/api/video/favor"
 *
 *  @return
 */
#define VideoFavorBaseUrl BaseUrl(Api_IP, @"/api/video/favor")

/**
 *  明星说文物
 *
 *  @param Api_IP
 *  @param @"/api/commentary/list"
 *
 *  @return
 */
#define CommentaryListBaseUrl BaseUrl(Api_IP, @"/api/commentary/list")

/**
 *  展览是否收藏
 *
 *  @param Api_IP
 *  @param @"/api/exhibition/isFavor"
 *
 *  @return
 */
#define ExhibitionIsFavorBaseUrl BaseUrl(Api_IP, @"/api/exhibition/isFavor")
/**
 *  馆藏是否收藏
 *
 *  @param Api_IP
 *  @param @"/api/collection/isFavor"
 *
 *  @return
 */
#define CollectionIsFavorBaseUrl BaseUrl(Api_IP, @"/api/collection/isFavor")

/**
 *  活动是否收藏
 *
 *  @param Api_IP
 *  @param @"/api/activity/isFavor"
 *
 *  @return
 */
#define ActivityIsFavorBaseUrl BaseUrl(Api_IP, @"/api/activity/isFavor")


#endif /* UrlSetting_h */
