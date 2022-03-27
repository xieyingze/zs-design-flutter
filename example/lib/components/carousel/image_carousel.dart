// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
// import 'package:media_app_flutter/common/constant/colors.dart';
// import 'package:media_app_flutter/common/constant/fontsize.dart';
// import 'package:media_app_flutter/common/utils/datetime.dart';
// import 'package:media_app_flutter/models/common/carousel.dart';
//
// class MBImageCarousel extends StatelessWidget {
//   /// 图片轮播数据 (模型)
//   final Carousel? carousel;
//
//   /// 图片轮播列表数据
//   List<CarouselItem> get carouseItemList => carousel?.list ?? [];
//
//   /// 点击了某个item
//   final ValueChanged<int>? onItemClick;
//
//   /// index改变
//   final ValueChanged<int>? onIndexChange;
//
//   MBImageCarousel(this.carousel, {Key? key, this.onItemClick, this.onIndexChange}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildCarouse();
//   }
//
//   /*
//    * @description: 生成时间字符串
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   String _getTime(String dateString) {
//     return dateString.isEmpty ? "" : '${DateTimeUtils.timeDifference(dateString)}';
//   }
//
//   /*
//    * @description: 根据类型生成图片轮播
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   Widget _buildCarouse() {
//     if (carousel != null) {
//       switch (carousel?.showType) {
//
//         /// 宽高撑满，不圆角
//         case 1:
//           return _buildType1();
//
//         /// 四周留白，圆角
//         case 2:
//           return _buildType2();
//
//         /// 四周留白，圆角，可看到左右卡片，并且居中
//         case 3:
//           return _buildType3();
//
//         /// 四周留白，圆角，可看到左右卡片，并且左对齐
//         case 4:
//           return _buildType4();
//         default:
//           return _buildType1();
//       }
//     }
//     return Container();
//   }
//
//   /*
//    * @description: 宽高撑满，不圆角
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   Widget _buildType1() {
//     return Container(
//       width: double.infinity,
//       height: 300,
//       child: Swiper(
//         onTap: (index) {
//           if (onItemClick != null) {
//             onItemClick!(index);
//           }
//         },
//         onIndexChanged: (index) {
//           if (onIndexChange != null) {
//             onIndexChange!(index);
//           }
//         },
//         autoplay: true,
//         itemBuilder: (c, i) {
//           return Container(
//             color: Colors.transparent,
//             child: Container(
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.transparent, Colors.black87],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                       ),
//                       child: Image.network(
//                         carouseItemList[i].promotionImg ?? "",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 15,
//                     bottom: 15,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 2),
//                           child: Text(
//                             carouseItemList[i].title ?? "",
//                             style: TextStyle(
//                               color: KColors.white(),
//                               fontSize: fontSize18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               carouseItemList[i].author ?? "",
//                               style: TextStyle(
//                                 color: KColors.fontNormal(),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 5),
//                               child: Text(
//                                 _getTime(carouseItemList[i].datetime ?? ""),
//                                 style: TextStyle(
//                                   color: KColors.fontNormal(),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: carouseItemList.length,
//       ),
//     );
//   }
//
//   /*
//    * @description: 四周留白，圆角
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   Widget _buildType2() {
//     return Container(
//       width: double.infinity,
//       height: 250,
//       child: Swiper(
//         onTap: (index) {
//           if (onItemClick != null) {
//             onItemClick!(index);
//           }
//         },
//         onIndexChanged: (index) {
//           if (onIndexChange != null) {
//             onIndexChange!(index);
//           }
//         },
//         autoplay: true,
//         outer: true,
//         viewportFraction: 0.91,
//         scale: 0.8,
//         itemBuilder: (c, i) {
//           return Container(
//             color: Colors.transparent,
//             child: Container(
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.transparent, Colors.black87],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.network(
//                         carouseItemList[i].promotionImg ?? "",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 15,
//                     bottom: 15,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 2),
//                           child: Text(
//                             carouseItemList[i].title ?? "",
//                             style: TextStyle(
//                               color: KColors.white(),
//                               fontSize: fontSize18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               carouseItemList[i].author ?? "",
//                               style: TextStyle(
//                                 color: KColors.fontNormal(),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 5),
//                               child: Text(
//                                 _getTime(carouseItemList[i].datetime ?? ""),
//                                 style: TextStyle(
//                                   color: KColors.fontNormal(),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: carouseItemList.length,
//       ),
//     );
//   }
//
//   /*
//    * @description: 四周留白，圆角，可看到左右卡片，并且居中
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   Widget _buildType3() {
//     return Container(
//       width: double.infinity,
//       height: 250,
//       child: Swiper(
//         onTap: (index) {
//           if (onItemClick != null) {
//             onItemClick!(index);
//           }
//         },
//         onIndexChanged: (index) {
//           if (onIndexChange != null) {
//             onIndexChange!(index);
//           }
//         },
//         autoplay: true,
//         outer: true,
//         viewportFraction: 0.9,
//         itemBuilder: (c, i) {
//           return Container(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             color: Colors.transparent,
//             child: Container(
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.transparent, Colors.black87],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.network(
//                         carouseItemList[i].promotionImg ?? "",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 15,
//                     bottom: 15,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 2),
//                           child: Text(
//                             carouseItemList[i].title ?? "",
//                             style: TextStyle(
//                               color: KColors.white(),
//                               fontSize: fontSize18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               carouseItemList[i].author ?? "",
//                               style: TextStyle(
//                                 color: KColors.fontNormal(),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 5),
//                               child: Text(
//                                 _getTime(carouseItemList[i].datetime ?? ""),
//                                 style: TextStyle(
//                                   color: KColors.fontNormal(),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: carouseItemList.length,
//       ),
//     );
//   }
//
//   /*
//    * @description: 四周留白，圆角，可看到左右卡片，并且左对齐
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   Widget _buildType4() {
//     return Container(
//       width: double.infinity,
//       height: 250,
//       child: Swiper(
//         onTap: (index) {
//           if (onItemClick != null) {
//             onItemClick!(index);
//           }
//         },
//         onIndexChanged: (index) {
//           if (onIndexChange != null) {
//             onIndexChange!(index);
//           }
//         },
//         autoplay: true,
//         outer: true,
//         viewportFraction: 0.91,
//         itemBuilder: (c, i) {
//           return Container(
//             color: Colors.transparent,
//             child: Container(
//               margin: const EdgeInsets.only(right: 25),
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.transparent, Colors.black87],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.network(
//                         carouseItemList[i].promotionImg ?? "",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 15,
//                     bottom: 15,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 2),
//                           child: Text(
//                             carouseItemList[i].title ?? "",
//                             style: TextStyle(
//                               color: KColors.white(),
//                               fontSize: fontSize18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               carouseItemList[i].author ?? "",
//                               style: TextStyle(
//                                 color: KColors.fontNormal(),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 5),
//                               child: Text(
//                                 _getTime(carouseItemList[i].datetime ?? ""),
//                                 style: TextStyle(
//                                   color: KColors.fontNormal(),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: carouseItemList.length,
//       ),
//     );
//   }
// }
