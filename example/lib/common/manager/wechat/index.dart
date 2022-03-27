// /*
//  * 微信管理类
//  * 微信登录、微信分享等
//  */
// import 'dart:io';
//
// import 'package:fluwx/fluwx.dart' as wechat;
// import 'package:fluwx/fluwx.dart';
// import 'package:media_app_flutter/common/constant/key.dart';
// import 'package:media_app_flutter/common/manager/eventbus/flutter_easyloading.dart';
// import 'package:media_app_flutter/common/utils/alert.dart';
//
// enum WechatShareType {
//   // 会话
//   SESSION,
//   // 朋友圈
//   TIMELINE,
//   // 收藏
//   FAVORITE,
// }
//
// class WechatManager {
//   static final WechatManager _singleton = WechatManager._();
//   static WechatManager get instance => _singleton;
//   WechatManager._();
//
//   /*
//    * @description   初始化微信SDK
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/18/22 5:30 PM
//    */
//   Future<bool> initWechatManager() async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     bool isSuccess = await wechat.registerWxApi(
//       appId: KAppKey.wechatAppKey,
//       universalLink: KAppKey.wechatUniversalLink,
//     );
//     return isSuccess;
//   }
//
//   /*
//    * @description   发起微信认证
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/18/22 5:30 PM
//    */
//   Future<bool> startWechatAuth() async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     bool isSuccess = await wechat.sendWeChatAuth(scope: 'snsapi_userinfo');
//     _onListenAuth();
//     return isSuccess;
//   }
//
//   /*
//    * @description   微信认证监听
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/18/22 5:30 PM
//    */
//   void _onListenAuth() {
//     // 监听结果
//     wechat.weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
//       if (res is wechat.WeChatAuthResponse && res.errCode == 0) {
//         // 将响应结果通过eventbus传递出去
//         eventBusInstance.emit(ThirdWeChatAuthEvent(code: res.code));
//       }
//     });
//   }
//
//   /*
//    * @description   检查微信是否安装
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/18/22 5:30 PM
//    */
//   Future<bool> get isInstanced async =>
//       (Platform.isIOS == false && Platform.isAndroid == false)
//           ? false
//           : await wechat.isWeChatInstalled;
//
//   /*
//    * @description   分享文本
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/19/22 10:29 AM
//    */
//   Future<bool> shareText(
//       {required WechatShareType shareType, required String text}) async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     // 监听分享结果
//     WeChatScene scene = WeChatScene.SESSION;
//     switch (shareType) {
//       case WechatShareType.SESSION:
//         scene = WeChatScene.SESSION;
//         break;
//       case WechatShareType.FAVORITE:
//         scene = WeChatScene.FAVORITE;
//         break;
//       case WechatShareType.TIMELINE:
//         scene = WeChatScene.TIMELINE;
//         break;
//       default:
//         break;
//     }
//     bool isSuccess =
//         await wechat.shareToWeChat(WeChatShareTextModel(text, scene: scene));
//     return isSuccess;
//   }
//
//   /*
//    * @description   分享图片
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/19/22 10:29 AM
//    */
//   Future<bool> shareImage({
//     required WechatShareType shareType,
//     required String imageUrl,
//   }) async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     // 监听分享结果
//     WeChatScene scene = WeChatScene.SESSION;
//     switch (shareType) {
//       case WechatShareType.SESSION:
//         scene = WeChatScene.SESSION;
//         break;
//       case WechatShareType.FAVORITE:
//         scene = WeChatScene.FAVORITE;
//         break;
//       case WechatShareType.TIMELINE:
//         scene = WeChatScene.TIMELINE;
//         break;
//       default:
//         break;
//     }
//     WeChatImage source = WeChatImage.network(imageUrl);
//     bool isSuccess =
//         await wechat.shareToWeChat(WeChatShareImageModel(source, scene: scene));
//     return isSuccess;
//   }
//
//   /*
//    * @description   分享网页
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/19/22 10:29 AM
//    */
//   Future<bool> shareWebPage({
//     required WechatShareType shareType,
//     String title = '分享网页',
//     required String imageUrl,
//     required String url,
//   }) async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     // 监听分享结果
//     WeChatScene scene = WeChatScene.SESSION;
//     switch (shareType) {
//       case WechatShareType.SESSION:
//         scene = WeChatScene.SESSION;
//         break;
//       case WechatShareType.FAVORITE:
//         scene = WeChatScene.FAVORITE;
//         break;
//       case WechatShareType.TIMELINE:
//         scene = WeChatScene.TIMELINE;
//         break;
//       default:
//         break;
//     }
//     WeChatImage source = WeChatImage.network(imageUrl);
//     bool isSuccess = await wechat.shareToWeChat(WeChatShareWebPageModel(
//       url,
//       title: title,
//       thumbnail: source,
//       scene: scene,
//     ));
//     return isSuccess;
//   }
//
//   /*
//    * @description   打开小程序
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/19/22 11:02 AM
//    */
//   Future<bool> openMiniProgram({required String id}) async {
//     if (Platform.isIOS == false && Platform.isAndroid == false) {
//       // 如果不是移动设备允许操作
//       return false;
//     }
//     // wechat.launchWeChatMiniProgram(username: "gh_d43f693ca31f");
//     bool isSuccess = await wechat.launchWeChatMiniProgram(username: id);
//     // 监听打开小程序结果
//     _onListenOpenMiniProgram();
//     return isSuccess;
//   }
//
//   /*
//    * @description   监听打开小程序结果
//    * @param
//    * @return
//    * @author        jay
//    * @time          1/19/22 11:02 AM
//    */
//   void _onListenOpenMiniProgram() {
//     wechat.weChatResponseEventHandler.listen((res) {
//       if (res is WeChatLaunchMiniProgramResponse) {
//         if (res.isSuccessful) {
//           Alert.alertTip('打开小程需成功');
//         }
//       }
//     });
//   }
// }
