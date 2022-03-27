import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class MBImagePickerController extends BaseController {
  var imagePath = ''.obs;

  RxList<dynamic> images = [].obs;

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
      XFile? file = await ZSImagePicker.instance.pickerVideo();
      """;
  /*
   * @description:    选择单张图片
   * @param:          
   * @return:         
   * @author:         jay xie
   * @time:           3/10/22 11:14 PM
   */
  void onSelectSingleImage() async {
    // XFile? file = await ZSImagePicker.pickImage();
    // String path = file?.path ?? '';
    // if (path.length > 0) {
    //   imagePath.value = path;
    // }
  }

  /*
   * @description:    选择多张图片
   * @param:          
   * @return:         
   * @author:         jay xie
   * @time:           3/10/22 11:30 PM
   */
  void onSelectMultiImage() async {
    // List<String> list = [];
    // List<XFile>? xFiles = await ZSImagePicker.pickMultiImage();
    // if (xFiles != null) {
    //   xFiles.forEach((element) {
    //     list.add(element.path);
    //   });
    // }
    // if (list.length > 0) {
    //   images.value = list;
    // }
  }

  /*
   * @description   跳转到图片预览
   * @param         
   * @return        
   * @author        jay    
   * @time          3/11/22 2:40 PM  
   */
  void onJumpToImageViewer() {
    // List<String> images = [
    //   'https://picsum.photos/id/1001/5616/3744',
    //   'https://picsum.photos/id/1003/1181/1772',
    // ];
    // ZSImagePreviewer.show(images: images);
  }
}
