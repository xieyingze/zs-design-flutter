import 'package:flutter/material.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class MBPickerController extends BaseController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

   String pickerData = '''
          [
              {
                  "a": [
                      {
                          "a1": [
                              1,
                              2,
                              3,
                              4
                          ]
                      },
                      {
                          "a2": [
                              5,
                              6,
                              7,
                              8,
                              555,
                              666,
                              999
                          ]
                      },
                      {
                          "a3": [
                              9,
                              10,
                              11,
                              12
                          ]
                      }
                  ]
              },
              {
                  "b": [
                      {
                          "b1": [
                              11,
                              22,
                              33,
                              44
                          ]
                      },
                      {
                          "b2": [
                              55,
                              66,
                              77,
                              88,
                              99,
                              1010,
                              1111,
                              1212,
                              1313,
                              1414,
                              1515,
                              1616
                          ]
                      },
                      {
                          "b3": [
                              1010,
                              1111,
                              1212,
                              1313,
                              1414,
                              1515,
                              1616
                          ]
                      }
                  ]
              },
              {
                  "c": [
                      {
                          "c1": [
                              "a",
                              "b",
                              "c"
                          ]
                      },
                      {
                          "c2": [
                              "aa",
                              "bb",
                              "cc"
                          ]
                      },
                      {
                          "c3": [
                              "aaa",
                              "bbb",
                              "ccc"
                          ]
                      },
                      {
                          "c4": [
                              "a1",
                              "b1",
                              "c1",
                              "d1"
                          ]
                      }
                  ]
              }
          ]
    ''';

   String pickerData2 = '''
          [
              [
                  1,
                  2,
                  3,
                  4
              ],
              [
                  11,
                  22,
                  33,
                  44
              ],
              [
                  "aaa",
                  "bbb",
                  "ccc"
              ]
          ]
    ''';

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
