import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

////////////////////////////// 下划线 //////////////////////////////

class BaseImage extends StatelessWidget {
  /*
   *  图片名称
   */
  final String name;
  /*
   * 图片颜色
   */
  final Color? color;
  /*
   * 图片宽度
   */
  final double? width;
  /*
   * 图片高度
   */
  final double? height;
  /*
   * 图片填充模式哦
   */
  final BoxFit? fitModel;
  /*
   * 图片点击事件
   */
  // final Function? onTap;

  /*
   * 外部接口
   */
  const BaseImage({
    required this.name,
    this.color,
    this.width,
    this.height,
    // this.onTap,
    this.fitModel = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getImageItem(name: name, color: color, width: width, height: height, fitModel: fitModel);
  }

  Widget _getImageItem({
    required String name,
    Color? color,
    double? width,
    double? height,
    BoxFit? fitModel,
  }) {
    if (name.contains('http') || name.contains('https')) {
      if (name.contains('svg')) {
        // return SvgPicture.network(
        //   name,
        //   color: color,
        //   width: width,
        //   height: height,
        // );
        return Container();
      } else {
        return OctoImage(
          width: width,
          height: height,
          image: CachedNetworkImageProvider(name),
          placeholderBuilder: OctoPlaceholder.blurHash(
            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          ),
          errorBuilder: OctoError.icon(color: Colors.red),
          fit: BoxFit.cover,
        );
      }
    } else {
      if (name.contains('svg')) {
        // return SvgPicture.asset(
        //   name,
        //   color: color,
        //   width: width,
        //   height: height,
        //   fit: fitModel,
        // );
        return Container();
      } else {
        return Image.asset(
          name,
          color: color,
          width: width,
          height: height,
          fit: fitModel,
          scale: 3.0,
        );
      }
    }
  }
}
