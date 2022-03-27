// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webviewx/webviewx.dart';
// import 'package:media_app_flutter/common/constant/screen.dart';
//
// class CommonWebView extends StatefulWidget {
//   final String url;
//   CommonWebView({Key? key, required this.url}) : super(key: key);
//
//   @override
//   _CommonWebViewState createState() => _CommonWebViewState();
// }
//
// class _CommonWebViewState extends State<CommonWebView> {
//   WebViewXController? webviewController;
//   // final _initialContent =
//   //     '<html><body>12312</body><script>window.testPromt.postMessage(\'{"1":"2"}\');</script></html>';
//   final _initialContent = '';
//   Size get screenSize => MediaQuery.of(context).size;
//
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration(milliseconds: GetPlatform.isWeb ? 1000 : 200), () {
//       if (webviewController != null && widget.url.isNotEmpty) {
//         webviewController!.loadContent(
//           widget.url,
//           SourceType.url,
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WebViewX(
//       key: const ValueKey('webviewx'),
//       initialContent: _initialContent,
//       initialSourceType: SourceType.html,
//       width: GetPlatform.isWeb ? KLayout.width : double.infinity,
//       height: GetPlatform.isWeb ? KLayout.height : double.infinity,
//       onWebViewCreated: (controller) => webviewController = controller,
//       onPageStarted: (url) {},
//       onPageFinished: (url) {},
//       // dartCallBacks: {
//       //   DartCallback(
//       //     name: "testPromt",
//       //     callBack: (mes) {
//       //       print(jsonDecode(mes));
//       //     },
//       //   )
//       // },
//     );
//   }
// }
