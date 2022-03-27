////////////////////////////// 第三方库相关 //////////////////////////////

/// 微信认证权限事件
class ThirdWeChatAuthEvent {
  // 认证结果返回code，然后根据code请求access_token https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
  String? code;
  ThirdWeChatAuthEvent({this.code});
}

/// 微博认证权限事件
class ThirdWeiboAuthEvent {
  String? userId;
  String? accessToken;
  ThirdWeiboAuthEvent({this.userId, this.accessToken});
}
