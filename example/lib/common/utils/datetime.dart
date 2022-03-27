// import 'package:date_format/date_format.dart';
// import 'package:intl/intl.dart';
//
// class DateTimeUtils {
//   /*
//    * @description   获取当前的时间
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:08 AM
//    */
//   static DateTime now() {
//     return DateTime.now();
//   }
//
//   /*
//    * @description   获取当月的天数
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:08 AM
//    */
//   static int daysInMonth(DateTime date) {
//     return DateTime(date.year, date.month + 1, 0).day;
//   }
//
//   /*
//    * @description   获取当前日期是星期几
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:08 AM
//    */
//   static String weekday(DateTime date) {
//     Map weekdays = {
//       1: '星期一',
//       2: '星期二',
//       3: '星期三',
//       4: '星期四',
//       5: '星期五',
//       6: '星期六',
//       7: '星期七',
//     };
//     return weekdays[date.weekday];
//   }
//
//   /*
//    * @description   不传参数时返回当前时间，字符串可为 标准的 DateTime字符串， 也可以为 20:05 这种只包含时间的字符串
//    * @param         [ ] 参数可为空
//    * @return        DateTime
//    * @author        jay
//    * @time          7/1/21 10:18 AM
//    */
//   static DateTime parse([dynamic date]) {
//     return date == null
//         ? DateTimeUtils.now()
//         : date.runtimeType == DateTime
//             ? date
//             : DateTimeUtils._parse(date);
//   }
//
//   static DateTime? _parse(String str) {
//     if (str.contains('-')) return DateTime.tryParse(str);
//
//     String prefix = DateTimeUtils.format('yyyy-MM-dd');
//     return DateTime.tryParse('$prefix $str');
//   }
//
//   /*
//    * @description   按照需要格式化时间字符串格式 处理 DateTime
//    * @param         newPattern 时间字符串格式； date DateTime 当date为null取当前的时间
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:25 AM
//    */
//   static String format(String newPattern, [dynamic date]) {
//     return formatDate(date, [newPattern]);
//   }
//
//   /*
//    * @description   从时间戳转换为指定格式的时间字符串
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 3:24 PM
//    */
//   static String formatterFromTimestamp(
//       {required int timestamp, required Map<String, String> formatter}) {
//     String targetString = "";
//     final date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
//     // final String tmp = date.toString();
//     String year = date.year.toString();
//     String month = date.month.toString();
//     if (date.month <= 9) {
//       month = "0" + month;
//     }
//     String day = date.day.toString();
//     if (date.day <= 9) {
//       day = "0" + day;
//     }
//     String hour = date.hour.toString();
//     if (date.hour <= 9) {
//       hour = "0" + hour;
//     }
//     String minute = date.minute.toString();
//     if (date.minute <= 9) {
//       minute = "0" + minute;
//     }
//     String second = date.second.toString();
//     if (date.second <= 9) {
//       second = "0" + second;
//     }
//     // String millisecond = date.millisecond.toString();
//     String morningOrafternoon = "上午";
//     if (date.hour >= 12) {
//       morningOrafternoon = "下午";
//     }
//
//     if (formatter["y-m"] != null && formatter["m-d"] != null) {
//       targetString = year +
//           (formatter["y-m"] ?? "") +
//           month +
//           (formatter["m-d"] ?? "") +
//           day;
//     } else if (formatter["y-m"] == null && formatter["m-d"] != null) {
//       targetString = month + (formatter["m-d"] ?? "") + day;
//     } else if (formatter["y-m"] != null && formatter["m-d"] == null) {
//       targetString = year + (formatter["y-m"] ?? "") + month;
//     }
//
//     targetString += " ";
//
//     if (formatter["m-a"] != null) {
//       targetString += morningOrafternoon + " ";
//     }
//
//     if (formatter["h-m"] != null && formatter["m-s"] != null) {
//       targetString += hour +
//           (formatter["h-m"] ?? "") +
//           minute +
//           (formatter["m-s"] ?? "") +
//           second;
//     } else if (formatter["h-m"] == null && formatter["m-s"] != null) {
//       targetString += minute + (formatter["m-s"] ?? "") + second;
//     } else if (formatter["h-m"] != null && formatter["m-s"] == null) {
//       targetString += hour + (formatter["h-m"] ?? "") + minute;
//     }
//     return targetString;
//   }
//
//   /*
//    * @description   判断两个时间 DateTime是否一样
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:27 AM
//    */
//   static bool isAtSameDay(DateTime day1, DateTime day2) {
//     return day1.difference(day2).inDays == 0 && day1.day == day2.day;
//   }
//
//   /*
//    * @description   判断时间 DateTime 是否在 时间区间上
//    * @param
//    * @return
//    * @author        jay
//    * @time          7/1/21 10:27 AM
//    */
//   static bool isInRange(DateTime date, DateTime start, DateTime end) {
//     return (date.isAfter(start) && date.isBefore(end)) ||
//         date.isAtSameMomentAs(start) ||
//         date.isAtSameMomentAs(end);
//   }
//
//   /*
//    * @description: 根据指定格式，格式化时间字符串
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   static String formatByString(String dateString,
//       {List<String> dateFormat: DATEFORMAT_YMD}) {
//     DateTime dt = DateTime.parse(dateString);
//     return DateFormat(dateFormat.first, dateFormat.last).format(dt);
//   }
//
//   /*
//    * @description: 计算时间差
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   static String timeDifference(String dateStr) {
//     DateTime old = DateTime.parse(dateStr);
//     DateTime now = DateTime.now();
//
//     var difference = now.difference(old);
//     var day = difference.inDays;
//     var hour = difference.inHours;
//     var min = difference.inMinutes;
//     var second = difference.inSeconds;
//
//     if (day >= 1) {
//       if (day > 1) {
//         return formatByString(dateStr, dateFormat: DATEFORMAT_MD);
//       }
//       return "$day天前";
//     } else if (hour < 24 && hour > 1) {
//       return "$hour小时前";
//     } else if (min > 0 && min < 60) {
//       return "$min分钟前";
//     } else if (second > 0 && second < 60) {
//       return "刚刚";
//     }
//
//     return dateStr;
//   }
// }
//
// const DATEFORMAT_YMD = ['y年M月d日', 'zh'];
// const DATEFORMAT_YMDE = ['y年M月d日 EEEE', 'zh'];
// const DATEFORMAT_HM = ['HH:mm', 'zh'];
// const DATEFORMAT_MD = ['MM-dd', 'zh'];
//
// // const YYYY = "yyyy";
// // const MM = "MM";
// // const M_DD = "M-dd";
// // const MM_DD = "MM-dd";
// // const YYYY_MM = "yyyy-MM";
// // const YY_MM_DD = "yy-MM-dd";
// // ignore: constant_identifier_names
// const YYYY_MM_DD = {"y-m": "-", "m-d": "-"}; //"yyyy-MM-dd";
// // const MM_DD_HH_MM = "MM-dd HH:mm";
// // ignore: constant_identifier_names
// const MM_DD_HH_MM_SS = {"m-d": "-", "h-m": ":"}; //"MM-dd HH:mm:ss";
// // ignore: constant_identifier_names
// const YYYY_MM_DD_HH_MM = {
//   "y-m": "-",
//   "m-d": "-",
//   "h-m": ":"
// }; //"yyyy-MM-dd HH:mm";
// // ignore: constant_identifier_names
// const YYYY_MM_DD_HH_MM_SS = {
//   "y-m": "-",
//   "m-d": "-",
//   "h-m": ":",
//   "m-s": ":"
// }; //"yyyy-MM-dd HH:mm:ss";
//
// // const MM_DD_EN = "MM/dd";
// // const YYYY_MM_EN = "yyyy/MM";
// // ignore: constant_identifier_names
// const YYYY_MM_DD_EN = {"y-m": "/", "m-d": "/"}; //"yyyy/MM/dd"
// // const MM_DD_HH_MM_EN = "MM/dd HH:mm";
// // const MM_DD_HH_MM_SS_EN = "MM/dd HH:mm:ss";
// // ignore: constant_identifier_names
// const YYYY_MM_DD_HH_MM_EN = {
//   "y-m": "/",
//   "m-d": "/",
//   "h-m": ":",
//   "m-s": ":"
// }; //"yyyy/MM/dd HH:mm";
// // const YYYY_MM_DD_HH_MM_SS_EN = "yyyy/MM/dd HH:mm:ss";
//
// // const YYYY_MM_DD_HH_MM_SS_EN_SSSS = "yyyy/MM/dd HH:mm:ss.SSSS";
//
// // const MM_DD_CN = "MM月dd日";
// // const YYYY_MM_CN = "yyyy年MM月";
// // ignore: constant_identifier_names
// const YYYY_MM_DD_CN = {"y-m": "年", "m-d": "月", "d-h": "日"}; //"yyyy年MM月dd日";
// // const MM_DD_HH_MM_CN = "MM月dd日 HH:mm";
// // const MM_DD_HH_MM_SS_CN = "MM月dd日 HH:mm:ss";
// // const YYYY_MM_DD_HH_MM_CN = "yyyy年MM月dd日 HH:mm";
// // const YYYY_MM_DD_HH_MM_SS_CN = "yyyy年MM月dd日 HH:mm:ss";
//
// // const YYYY_MM_DD_P = "yyyy.MM.dd";
// // const YYYY_MM_DD_HH_MM_P = "yyyy.MM.dd HH:mm";
// // const HH_MM_SS_SSSS = "HH:mm:ss SSSS";
// // const HH_MM_SS = "HH:mm:ss";
// // ignore: constant_identifier_names
// const HH_MM = {"h-m": ":"}; //"HH:mm";
// // const AAA_HH_MM = "aaa HH:mm";
// // const AAA_H_MM = "aaa h:mm";
// // const HH = "HH";
// //
// // const YYYYMM = "yyyyMM";
// // const YYYYMMDD = "YYYYMMdd";
// // const YYYYMMDDHHMMSSSSSS = "yyyyMMddHHmmssSSSS";
// //
// // const YYYYMM_DD_HH_MM_SS_EN = "YYYY/MM/dd HH:mm:ss";
