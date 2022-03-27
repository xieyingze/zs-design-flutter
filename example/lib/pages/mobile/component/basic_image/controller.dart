import 'package:zs_design_flutter_example/common/index.dart';

class MBImageController extends BaseController {
  /// 图片链接
  String imageUrl1 = 'https://cdn.pixabay.com/photo/2020/12/14/15/44/man-5831234_960_720.jpg';

  String imageUrl2 = 'https://cdn.pixabay.com/photo/2021/08/02/05/17/sunflowers-6515860_960_720.jpg';

  String imageUrl3 = 'https://cdn.pixabay.com/photo/2014/01/22/19/44/flower-field-250016_960_720.jpg';

  String demo1Desc = """
       ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          url: controller.imageUrl1,
          size: Size(120, 80),
        )
      """;

  String demo2Desc = """
      ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.avatar,
          avatarText: 'HA',
          url: controller.imageUrl2,
          size: Size(80, 80),
          borderColor: ZSColors.card(),
          borderWidth: 10,
        )
      """;

  String demo3Desc = """
      ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.indicator,
          url: controller.imageUrl3,
          size: Size(120, 80),
          backgroundColor: ZSColors.mainYellow(),
        )
      """;

  String demo4Desc = """
      ZSImage(
          borderRadius: 40,
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.avatar,
          avatarText: 'JX',
          url: controller.imageUrl2,
          size: Size(80, 80),
          showShadow: true,
        )
      """;
}
