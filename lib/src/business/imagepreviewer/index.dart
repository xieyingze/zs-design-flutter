import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../index.dart';
import '../../lib/photoview/photo_view.dart';
import '../../lib/photoview/photo_view_gallery.dart';
import '../../lib/photoview/src/photo_view_computed_scale.dart';
import '../../lib/smoothindicator/smooth_page_indicator.dart';

// void showImagePreview({required List<String> images, int? index}) {
//   Get.to(
//       SMImagePreviewer(
//         images: images,
//       ),
//       transition: Transition.fadeIn);
// }

class ZSImagePreviewer extends StatefulWidget {
  final List<String> images;
  final int index;
  final Function? onDismissCallBack;
  ZSImagePreviewer({Key? key, required this.images, this.index = 0, this.onDismissCallBack}) : super(key: key);

  @override
  _ZSImagePreviewerState createState() => _ZSImagePreviewerState();

  /*
   * @description:    显示图片预览
   * @param:          
   * @return:         
   * @author:         jay xie
   * @time:           3/13/22 5:07 PM
   */
  // static show({required List<String> images, int? index}) {
  //   Get.to(
  //       SMImagePreviewer(
  //         images: images,
  //       ),
  //       transition: Transition.fadeIn);
  // }
}

class _ZSImagePreviewerState extends State<ZSImagePreviewer> {
  /// page管理
  PageController _controller = PageController(viewportFraction: 1, keepPage: true);

  /// 当前页数
  int _index = 0;

  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ZSColors.black(),
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              enableRotation: true,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.images[index]),
                  initialScale: PhotoViewComputedScale.contained * 1,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.images[index].toString()),
                  // gestureDetectorBehavior: HitTestBehavior.deferToChild,
                  onTapUp: (context, detail, val) {
                    if (widget.onDismissCallBack != null) {
                      widget.onDismissCallBack!();
                    }
                  },
                  onTapDown: (context, detail, val) => {},
                );
              },
              itemCount: widget.images.length,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: ZSColors.white(),
                    value: event == null ? 0 : (event.cumulativeBytesLoaded / event.expectedTotalBytes!.toInt()),
                  ),
                ),
              ),
              // backgroundDecoration: widget.backgroundDecoration,
              pageController: _controller,
              onPageChanged: (index) => _onHandlePageChanged(index: index),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: ZSIcon(
                  onTap: () {
                    if (widget.onDismissCallBack != null) {
                      widget.onDismissCallBack!();
                    }
                  },
                  padding: EdgeInsets.all(16),
                  data: Ionicons.close_outline,
                  size: 24,
                  color: ZSColors.white(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: SmoothPageIndicator(
                    count: widget.images.length,
                    controller: _controller,
                    effect: WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                      type: WormType.thin,
                      dotColor: ZSColors.white(alpha: 0.5),
                      activeDotColor: ZSColors.white(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  /*
   * @description:    页面滚动
   * @param:
   * @return:
   * @author:         jay xie
   * @time:           3/13/22 3:35 PM
   */
  void _onHandlePageChanged({required int index}) {
    setState(() {
      _index = index;
    });
  }
}
