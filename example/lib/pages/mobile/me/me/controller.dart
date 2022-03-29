import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:zs_design_flutter_example/common/constant/images.dart';
import 'package:zs_design_flutter_example/common/index.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter_example/main.dart';

class MBMeController extends BaseController {
  List<List<dynamic>> list = [
    [
      {'icon': KImage.meLike, 'title': '收藏与历史'},
      {'icon': KImage.meFeedback, 'title': '意见与反馈'}
    ],
    [
      {'icon': KImage.meClear, 'title': '清除缓存'},
      {'icon': KImage.meAgreement, 'title': '用户协议'},
      {'icon': KImage.mePrivate, 'title': '隐私政策'}
    ],
    [
      {'icon': KImage.meSetting, 'title': '账号设置'}
    ]
  ];

  var result = '初始0'.obs;

  void onSum() async {
    // int num = 100000000000;
    // int count = 0;
    // while (num > 0) {
    //   count = count + num;
    //   num--;
    // }
    // result.value = 'sum = $count';

    // num val = await compute(summ, 10000000000);
    // result.value = 'sum = $val';

    final task = Executor().execute(arg1: 1000000, fun1: summ);
    logger.v('---------');
    task.cancel();
  }

  // static Future<dynamic> calculation(int n) async {
  //   //创建一个ReceivePort
  //   final receivePort1 = new ReceivePort();
  //   //创建isolate
  //   Isolate isolate = await Isolate.spawn(createIsolate, receivePort1.sendPort);
  //
  //   //使用 receivePort1.first 获取sendPort1发送来的数据
  //   final sendPort2 = await receivePort1.first as SendPort;
  //   print("receivePort1接收到消息--sendPort2");
  //   //接收消息的ReceivePort
  //   final answerReceivePort = new ReceivePort();
  //   print("sendPort2发送消息--[$n,answerSendPort]");
  //   sendPort2.send([n, answerReceivePort.sendPort]);
  //   //获得数据并返回
  //   num result = await answerReceivePort.first;
  //   print("answerReceivePort接收到消息--计算结果$result");
  //   return result;
  // }
  //
  // //创建isolate必须要的参数
  // static void createIsolate(SendPort sendPort1) {
  //   final receivePort2 = new ReceivePort();
  //   //绑定
  //   print("sendPort1发送消息--sendPort2");
  //   sendPort1.send(receivePort2.sendPort);
  //   //监听
  //   receivePort2.listen((message) {
  //     //获取数据并解析
  //     print("receivePort2接收到消息--$message");
  //     num n = message[0] as num;
  //     final send = message[1] as SendPort;
  //     //返回结果
  //     num result = summ(n.toInt());
  //     print("answerSendPort发送消息--计算结果$result");
  //     send.send(result);
  //   });
  // }

  //计算0到 num 数值的总和
  num summ(int num) {
    int count = 0;
    while (num > 0) {
      count = count + num;
      num--;
    }
    return count;
  }
}
