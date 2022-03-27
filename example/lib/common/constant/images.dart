/// 本地png等图片的路径
const String localImagePath = 'lib/assets/images/';

/// 远程图片的路径
const String networkImagePath = 'https://commom.cdn.bcebos.com';

/// 网络占位图
const String placeholder = networkImagePath + '/intrade/country/flag_gb.png';

/*
 * 图片
 */
class KImage {
  /// search
  static String deleteCabin = KImage.png('icon_delete'); //垃圾桶删除按钮

  ////////////////////////////// News ///////////////////////////////
  static String newsLogo = KImage.png('icon_news_logo'); //导航栏带文字图标
  static String search = KImage.png('icon_common_search'); //导航栏带文字图标

  ////////////////////////////// Market ///////////////////////////////
  static String marketOptionalEdit = KImage.png('icon_market_edit'); // 添加到自选
  static String marketAdd = KImage.png('icon_market_add'); // 添加到自选
  static String marketOptionalAdd = KImage.png('icon_market_optional_add');
  static String marketOptionalDel = KImage.png('icon_market_optional_del');

  ////////////////////////////// Market ///////////////////////////////
  static String loginApple = KImage.png('icon_login_apple'); // Apple登录
  static String loginWeChat = KImage.png('icon_login_wechat'); // Apple登录
  static String loginWeibo = KImage.png('icon_login_weibo'); // Apple登录
  static String loginPassword = KImage.png('icon_login_password'); // Apple登录
  static String loginPhone = KImage.png('icon_login_phone'); // Apple登录

  ////////////////////////////// Me ///////////////////////////////
  static String meLike = KImage.png('icon_me_like'); // 收藏与历史
  static String meFeedback = KImage.png('icon_me_feedback'); // 意见与反馈
  static String meClear = KImage.png('icon_me_clear'); // 清楚缓存
  static String meAgreement = KImage.png('icon_me_agreement'); // 用户协议
  static String mePrivate = KImage.png('icon_me_private'); // 隐私政策
  static String meSetting = KImage.png('icon_me_setting'); // 账号设置

  ////////////////////////////// Common //////////////////////////////
  static String commonAdd = KImage.png('icon_common_add'); // 添加到自选
  static String commonShare = KImage.png('icon_common_share'); // 分享
  static String commonQRCode = KImage.png('icon_common_qrcode'); // 二维码
  static String commonDefaultAvatar = KImage.png('icon_common_avatar'); // 默认头像
  static String commonDel = KImage.png('icon_common_del'); // 搜索删除
  static String commonSearch = KImage.png('icon_common_search'); // 搜索
  static String commonSelected = KImage.png('icon_common_selected'); // 选中
  static String commonStar = KImage.png('icon_common_star'); // 收藏
  static String commonStarHighlight =
      KImage.png('icon_common_star_highlight'); // 收藏高亮

  static String commonStatusLoadFail =
      KImage.png('icon_common_loadfail'); // 加载失败状态
  static String commonStatusNoData = KImage.png('icon_common_nodata'); // 没有数据状态
  static String commonStatusUnLogin =
      KImage.png('icon_common_unlogin'); // 未登录状态

  ////////////////////////////// Me ///////////////////////////////
  static String tabbarNewsNormal = KImage.png('icon_tabbar_news_normal'); //
  static String tabbarNewsSelected = KImage.png('icon_tabbar_news_selected'); //
  static String tabbarMarketNormal = KImage.png('icon_tabbar_market_normal'); //
  static String tabbarMarketSelected =
      KImage.png('icon_tabbar_market_selected'); //
  static String tabbarMeNormal = KImage.png('icon_tabbar_me_normal'); //
  static String tabbarMeSelected = KImage.png('icon_tabbar_me_selected'); //

  /*
   * @description:    获取本地png图片路径
   * @params:         name: 图片名称
   * @return:         String
   * @author:         jay xie
   * @time:           26/01/21 10:49
   */
  static String png(String name) {
    if (name.contains('.png') ||
        name.contains('.jpg') ||
        name.contains('.jpeg') ||
        name.contains('.PNG')) {
      return localImagePath + name;
    }
    return localImagePath + name + '.png';
  }
}
