import 'dart:convert' as convert;

/*
 * 业务相关
 */
extension BusinessExtension on String {
  /*
   * @description:    首字母大写
   * @return:         String
   * @author:         jay xie
   * @time:           1/20/21 11:22 PM
   */
  String get firstLetterToUpperCase {
    return this[0].toUpperCase() + substring(1);
  }
}

/*
 * 格式相关
 */
extension FormatterExtension on String {
  /*
   * @description:    字符型转为金钱格式
   * @param:          point：精度
   * @return:         格式化后的字符串String
   * @author:         jay xie
   * @time:           1/20/21 11:14 PM
   */
  String formatterMoney({dynamic point}) {
    String str = double.parse(toString()).toString();
    // 分开截取
    List<String> sub = str.split('.');
    // 处理值
    List val = List.from(sub[0].split(''));
    // 处理点
    List<String> points = List.from(sub[1].split(''));

    dynamic pointLen = 2;
    if (point != null) {
      // 如果有设置精度，就取精度
      pointLen = point;
    } else {
      // 如果没有设置精度，就取小数点的精度
      // pointLen = points.length > 5 ? 5 : points.length;
    }
    //处理分割符
    for (int index = 0, i = val.length - 1; i >= 0; index++, i--) {
      // 除以三没有余数、不等于零并且不等于1 就加个逗号
      if (index % 3 == 0 && index != 0) val[i] = val[i] + ',';
    }

    int len = pointLen - points.length;
    // 处理小数点
    for (int i = 0; i <= len; i++) {
      points.add('0');
    }
    //如果大于长度就截取
    if (points.length > pointLen) {
      // 截取数组
      points = points.sublist(0, pointLen);
    }
    // 判断是否有长度
    if (points.isNotEmpty) {
      return '${val.join('')}.${points.join('')}';
    } else {
      return val.join('');
    }
  }

  /*
   * @description:    去掉金钱格式
   * @param:          point：精度
   * @return:         格式化后的字符串String
   * @author:         jay xie
   * @time:           1/20/21 11:14 PM
   */
  String removeMoneyFormatter() {
    return replaceAll(',', '');
  }

  /*
   * @description:    判断字符串是否为数字
   * @param:          void
   * @return:         字符串是否为数字
   * @author:         jay xie
   * @time:           1/20/21 11:14 PM
   */
  bool isNumFormatter() {
    try {
      double.parse(this);
    } on FormatException {
      return false;
    } finally {
      // ignore: control_flow_in_finally
      return true;
    }
  }
}

/*
 * 正则表达式
 */
extension RegexExtension on String {
  /*
   * @description 校验输入值是否为手机格式
   * @param
   * @return
   * @author King
   * @time 2021/3/4 11:01
   */
  bool regexMatchPhone() {
    RegExp regexPhone = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return regexPhone.hasMatch(this);
  }

  /*
   * @description 校验输入值是否为邮箱格式
   * @param
   * @return
   * @author King
   * @time 2021/3/4 11:02
   */
  bool regexMatchEmail() {
    // RegExp regexEmail = RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$");
    RegExp regexEmail = RegExp(
        "^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}\$");
    return regexEmail.hasMatch(this);
  }
}

/*
 * 字符串转换相关
 */
extension TansformExtension on String {
  /*
   * @description:    字符串转换为Json
   * @return:         Json
   * @author:         jay xie
   * @time:           1/20/21 11:17 PM
   */
  get transformToJson {
    return convert.jsonDecode(this);
  }

  /*
   * @description:    字符串转换为Map
   * @return:         Map
   * @author:         jay xie
   * @time:           1/20/21 11:17 PM
   */
  get transformToMap {
    Map<String, dynamic> map = convert.jsonDecode(this);
    return map;
  }
}

/*
 * 精度计算
 */
extension StringExtension on String {
  /*
   * @description:    字符串转double
   * @return:         String
   * @author:         jay xie
   * @time:           1/20/21 11:07 PM
   */
  double toDouble() {
    if (isEmpty) return 0.0;
    return double.parse(this);
  }

  /*
   * @description:    舍弃小数点后面的小数
   * @params:         point: 小数点第几位
   * @return:         void
   * @author:         jay xie
   * @time:           10/02/21 10:10
   */
  String downNum(int point) {
    String value = this;
    double num = toDouble();
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) < point) {
      // 小数点后有几位小数
      value = num.toStringAsFixed(point)
          .substring(0, num.toString().lastIndexOf(".") + point + 1)
          .toString();
    } else {
      value = num.toString()
          .substring(0, num.toString().lastIndexOf(".") + point + 1)
          .toString();
    }
    // }
    return value;
  }

  /*
   * @description:    小数点后面的小数四舍五入
   * @params:         point: 小数点第几位
   * @return:         void
   * @author:         jay xie
   * @time:           10/02/21 10:10
   */
  String floorNum(int point) {
    return toDouble().toStringAsFixed(point);
  }

  /*
   * @description   数字是否为整数
   * @param
   * @return
   * @author        jay
   * @time          6/9/21 2:18 PM
   */
  bool isIntNumber() {
    if (contains('.')) {
      List<String> arr = split('.');
      String str = arr.last;
      return str.toDouble() > 0 ? false : true;
    } else {
      return true;
    }
  }
}
