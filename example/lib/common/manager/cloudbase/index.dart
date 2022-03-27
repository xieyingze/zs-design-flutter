// /*
//  * 腾讯云管理单例
//  */
// import 'package:cloudbase_auth_nullsafety/cloudbase_auth_nullsafety.dart';
// import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
// import 'package:cloudbase_database_nullsafety/cloudbase_database_nullsafety.dart';
// import 'package:todolist_flutter/main.dart';
//
// class CloudBaseManager {
//   static final CloudBaseManager _singleton = CloudBaseManager._();
//   static CloudBaseManager get instance => _singleton;
//   CloudBaseManager._();
//
//   /*
//    * 参数
//    */
//   late CloudBaseCore cloudBaseCore;
//
//   /*
//    * @description:    初始化腾讯云
//    * @param:
//    * @return:
//    * @author:         jay xie
//    * @time:           11/14/21 12:39 AM
//    */
//   void initCloudBaseCore() {
//     CloudBaseCore core = CloudBaseCore.init({
//       // 填写您的云开发 env
//       'env': 'weappshop-dev-9gddy80y5d5cfd0a',
//       // 填写您的移动应用安全来源凭证
//       // 生成凭证的应用标识必须是 Android 包名或者 iOS BundleID
//       'appAccess': {
//         // 凭证
//         'key': '9a5abf77b325f84ef10d6d0ec4c82988',
//         // 版本
//         'version': '1'
//       },
//       // 请求超时时间（选填）
//       'timeout': 3000
//     });
//     cloudBaseCore = core;
//   }
//
//   /*
//    * @description:    初始化腾讯云鉴权
//    * @param:
//    * @return:
//    * @author:         jay xie
//    * @time:           11/14/21 12:17 AM
//    */
//   void initCloudAuth() async {
//     // 获取登录对象
//     CloudBaseAuth auth = CloudBaseAuth(cloudBaseCore);
//     // 获取登录状态
//     CloudBaseAuthState? authState = await auth.getAuthState();
//
//     // 唤起匿名登录
//     if (authState == null) {
//       await auth.signInAnonymously().then((success) {
//         // 登录成功
//         logger.d('登录成功-----$success');
//       }).catchError((err) {
//         // 登录失败
//         logger.d('登录失败-----$err');
//       });
//     }
//
//     // 获取用户信息
//     if (authState != null) {
//       await auth.getUserInfo().then((userInfo) {
//         // 获取用户信息成功
//         logger.d('获取用户信息成功-----$userInfo');
//       }).catchError((err) {
//         // 获取用户信息失败
//         logger.d('获取用户信息失败-----$err');
//       });
//     }
//   }
//
//   /*
//    * @description:    测试添加一个记录
//    * @param:
//    * @return:
//    * @author:         jay xie
//    * @time:           11/14/21 12:38 AM
//    */
//   void addDataBaseRecord() async {
//     CloudBaseDatabase database = CloudBaseDatabase(cloudBaseCore);
//     database
//         .collection('goods')
//         .add({'name': '美术课程2'})
//         .then((res) => {
//               logger.d('成功-----$res'),
//             })
//         .catchError((err) {
//           logger.d('失败-----$err');
//         });
//   }
// }
