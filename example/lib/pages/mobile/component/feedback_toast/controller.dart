import 'package:zs_design_flutter_example/common/index.dart';

class MBToastController extends BaseController {
  String demo1Desc = """
      XFile? file = await ZSImagePicker.instance.pickImage();
      String path = file?.path ?? '';
      """;

  String demo2Desc = """
      List<String> paths = [];
      List<XFile>? xFiles = await ZSImagePicker.instance.pickMultiImage();
      if (xFiles != null) {
        xFiles.forEach((element) {
          paths.add(element.path);
        });
      }
      """;

  String demo3Desc = """
      ZSToast.showError(message: '加载失败')
      """;

  String demo4Desc = """
      ZSToast.showWarming(message: '加载失败')
      """;
}
