/// 本地png等图片的路径
const String localImagePath = 'lib/assets/images/';

/// 远程图片的路径
const String networkImagePath = 'https://commom.cdn.bcebos.com';

/// 网络占位图
const String placeholder = '$networkImagePath/intrade/country/flag_gb.png';

/*
 * 图片
 */
class ZSImagePath {
  /// search
  static String deleteCabin = ZSImagePath.png('icon_delete'); //垃圾桶删除按钮

  /*
   * @description:    获取本地png图片路径
   * @params:         name: 图片名称
   * @return:         String
   * @author:         jay xie
   * @time:           26/01/21 10:49
   */
  static String png(String name) {
    if (name.contains('.png') || name.contains('.jpg') || name.contains('.jpeg') || name.contains('.PNG')) {
      return '$localImagePath$name';
    }
    return '$localImagePath$name.png';
  }
}
