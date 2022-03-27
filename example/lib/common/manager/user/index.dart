class UserManager {
  UserManager._();
  static final UserManager _singleton = UserManager._();
  static UserManager get instance => _singleton;

  /// 用户数据
  // UserModel? user;

  /// 是否已经登录
  // bool get isLogin => user != null && user?.uauthCode != null;

  /* 
   * @description: 检查是否登录
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  bool checkLogin() {
    // if (!isLogin) {
    //   Get.toNamed(RouteName.MBLoginPage.toString());
    //   return false;
    // }
    return true;
  }

  /* 
   * @description: 初始化用户数据
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  Future<bool> init() async {
    // var json = await StorageManager.instance.read<Map<String, dynamic>>(StorageKeys.user);
    // if (json != null) {
    //   user = UserModel.fromJson(json);
    // }
    return true;
  }
}
