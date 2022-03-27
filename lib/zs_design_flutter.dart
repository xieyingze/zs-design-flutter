// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

library zs_design;

// v1.0.0

/// 基础组件
export './src/basic/button.dart';
export './src/basic/expandlabel.dart';
export './src/basic/icon.dart';
export './src/basic/label.dart';
export './src/basic/progressCircular.dart';
export './src/basic/progressLine.dart';
export './src/basic/image.dart';

/// 样式
export './src/constant/colors.dart';
export './src/constant/fonts.dart';
export './src/constant/images.dart';
export './src/constant/screen.dart';
export './src/constant/styles.dart';

/// 容器组件
export './src/container/container.dart';
export './src/container/layout.dart';

/// 反馈组件
export './src/feedback/dialog/index.dart';
export './src/feedback/loading/index.dart';
export './src/feedback/modal/index.dart';
// export './src/feedback/notify/index.dart';
export './src/feedback/toast/index.dart';

/// 表单组件
export './src/form/textfiled.dart';
export './src/form/rate.dart';

/// lib
export './src/lib/easyloading/index.dart';

/// 主题管理
export './src/theme/index.dart';
