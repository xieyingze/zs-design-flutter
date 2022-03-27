import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';

import '../../../../main.dart';
import '../pluggable.dart';
import 'instance.dart';
import 'interceptor.dart';

const iconFontData =
    r'iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAUi0lEQVR4Xu2deXhUVZrGz7lVlY1981EEWWxw2lQAgZbdgelpkRkdx5mJUmExgIQlBJKqzLR2z7Tj2HbrdCoEQ9gEwpYEwWnbabuVVgcaBGkhklXnsd1wbNqHRbaEbFX3zFMQNMQkdc6tU7fu8uZf3u873/l95+Wk6qa+oowxB8EPCIBAhwQoDIKTAQKdE4BBcDpAoAsCMAiOBwjAIDgDIKCNAG4QbdwQZRMCMIhNGo1taiMAg2jjhiibEIBBbNJobFMbARhEGzdE2YQADGKTRmOb2gjAINq4IcomBGAQmzQa29RGAAbRxg1RNiEAg9ik0dimNgIwiDZuiLIJARjEJo3GNrURgEG0cUOUTQhE3SDrMv9yoKImNC1dv++cTZhim1EmsGHZzH7NDWcHE6fStHLzsQ+iuVxUDBIyRcP5r55iqnovIaQnIYQSSi8QQn/ds2efpzM2HjwdzU0htzUJrF0w+c7GxktFhLFpbXbYSCg9lpDQM3NF8ZH3Ze9cukEK5t31QLCl5SVGOvmsOyXnnIorI7uk4hXZm0E+6xJYPXf03GAgsK2LHV5RHHHp3pITv5RJQapB1i6YPKKx4eK7hJAeYYo8G5fYY/LK4qOfyNwMclmTQOu5KieEJIXZYWPPXv2Gy/wNRZ5BDhyg/o0r3mCMTedpEyV03/R/XvnAuHEZKo8eGvsSyPMkHyKMTOIhoFBli7esegmPlkcjzSCFCyfe0XTl8nuEkHiehUOa+F69v5O18fBnvHro7EegcP7YqU3NTQcEdt6Uu7u2m4C+S6k0g6xZcPfY5ob6AzT8NXi9IJaU2G3s8uJ3q2VtBnmsR8A/2/0bRthMkZ0ldu89NHPz4S9EYjrTSjPI6nnjJgdbGl9tfdeKpzamJCZM9haXH+MRQ2M/AmsenZjc0nS5UnTnfQYO7rco//WLonEd6aUZZE362CktjU3/TQjpxVkYi09MmJwFg3Disp8sb7b7RULYPwrtnNIvcstqhgrFdCGGQWSRRB6pBAoWTxoZuHxJ/LkGpS/nltWkyioGBpFFEnmkEvB73JsZY+miSZW4uL/17jixTzQu6q9B8CuWrJYgT+gvMa6cOxt6RuYUoUEJqfHtrh0jEhNOixskHCH8u+4E8j3uApWxFaILO1yuR3J2VvyXaFxXehhEJk3kipjAuswZA66cO/MJISxRKBklf8xdUnQnmT6dCcWFEcMgMmkiV8QE/GnunzKVPS6aSHG6Fnl3VWwXjQunh0HCEcK/60Zg0+MPd7/0WW3oAV93wUVPJU9ZOnxWVlZAMC6sHAYJiwgCvQj4PaOeYCz4tOh61OHM9pVUrhWN49HDIDyUoIk6gb1PPZx48oPa0DtXAwQXOzPku8nDU5/c0yAYxyWHQbgwQRRtAvlpo7NUNbBadB1FUf7VW1r9rGgcrx4G4SUFXdQIvFZY6Kw9vCF0ewwUXKSu59DkQRnP7qkTjOOWwyDcqCCMFgF/2ugFTA28IJpfUZSfe0ur/000TkQPg4jQglY6gfLyTcr+vDW1hJERYslpQ1K/AcOXF+0/IxYnpoZBxHhBLZnA6jmjU4PBQJloWqoohb7S6hzROFE9DCJKDHqpBPyzkysYIW7BpIGkfv2HLy/6/SnBOGE5DCKMDAGyCBTMu+u+QEtz6EN2Qj9UUYp9pdWLhYI0imEQjeAQFjkBkWEMbVZTExJ7Ja8oPvLHyCsInwEGCc8IiigQ0DCM4WoVVFH2+kqrPVEoqcOUMIhepLHODQS0DGMIJXDF9xi9avvRWr1wwiB6kcY6XxPQOoyBUPp6blnN/XqihEH0pI21rhLQNIwhdHvEJU5bteP4O3pihEH0pI21SOsY0dAwBiqEg9K3c8tquKZ2CuUNI4ZBZNJErrAE/B73FsbYo2GF7QSyhzHwrg+D8JKCLmICRhrGwLsZGISXFHQRE/B73GsYY5miiaIxjIG3BhiElxR0ERG4Nozh9ElCSJxQoigNY+CtAQbhJQVdRASMNoyBdzMwCC8p6DQTMOIwBt7NwCC8pKDTTEDrMAbF4VzlLaks0rywhEAYRAJEpOicQETDGCbMHJKak98cS74wSCzp22BtrcMYqEP5sa+k+rlYI4JBYt0BC69v5GEMvNhhEF5S0AkTMPIwBt7NwCC8pKATImD0YQy8m4FBeElBJ0TA6MMYeDcDg/CSgk6IgNGHMfBuBgbhJQUdN4H8uWNmqYGWX3MHtAr1HMbAWxsMwksKOm4CZhjGwLsZGISXFHRcBMwyjIFrM6FPdTHGHLzirnT4Ek8ZFM2fwyzDGHhJwyC8pKALSyCCYQyv5ZbVPBB2gRgIYBCdoIc+Tddcd3mQy5V4KnPz4dDXjFnux+9x72aM/ZPoxpwJSVOztx07Khqnhx4GiTLlgrljHwoEmv6TEDLsm6Xox4qirPOWVq2J8vK6pS9YPGlk4PKl0DAGsR9KD+WW1cwQC9JPDYNEkbXf497MGEvvbAlKyGdx8UmPZG0/Vh7FMnRJrXUYg8OVMCtnZ/kbuhSpYREYRAM0npDVc0anB4OBzRzaKw6n66GcXRVvcWgNKTHjMAZekDAILykB3aYl99x06eJXHxPCEnnDFIfzUW9JZQmv3ki6fI+7QGVshWhNTmd8avau914WjdNTD4NEgbbfM+oXjAVFv9yFUcXxI19p1S+iUFLUUpp1GAMvEBiElxSnbsOymf3qzn8Rmt6RwBlyg4xSZYOvrFr4f2Mta8mIyfeMekZlwR+K5lKcrkXeXRXbReP01sMgkonnp43KU9VgdiRpKaUvjZuZOm96+pMtkeSJdqyZhzHwsoFBeElx6CK9PdotcbD/LSMfTF/98mWOpWMiyZ8z6kdqMPgfoosbYRgDb80wCC8pDp3G1x6dZqaEVvbo1XdWxsaDpzmW11XSOozhU0JIf8GFzw75bvKw1Cf3NAjGxUQOg0jCLvn2+KYqSk4m9uh+b+amP3wsqVQpacw+jIEXAgzCSyqMTvbtccNylJyLi0+YuXJbeYWkciNOkzc7+XNCyEDBRJf73zLyNiP/2th+PzCIYIc7km9Y9v2b685/+ZHWd644SzDMA0WtwxgoVX7mK6v+Ced+DSGDQSS0Id+Tkq8ydaWEVGFS0KDidM7x7qp4KfprdbxCJMMYbup/8+D5a9+8EKvatawLg2ih1iam9fb4RHhqufZ1GXE4nsgtqcrTnkJ7pNZhDApVnveWVXu1rxybSBgkQu7+tJTVTFWzIkwjHB6rB4pWGcbACxwG4SXVgS4Gt8eNr911fqBopWEMvG2HQXhJdaDT+tpDURwFqhoMfU9fnwiWvxpKCd3fZ8iEBxc+t+VKpLnCxftnJ7/NCJkYTtf+313d+vzFqi1vh97EMN0PDKKxZa23h5ZPBn6eu7t2eFHGhNsbLtf9jjAyRGMJbcJoZVK/AfctL9p/JvJcHWcomHfXtEBL837R/FRR9vpKqz2icUbRwyAaO6H1T7yp4lzsK60sDi0b+kvYhq9Ov8kYSdZYxjdhUX6gmOdx/5Ywdq9ona74HqNXbT9aKxpnFD0MoqETEbz2+Dx5ytKRs7KyAteX3ZbzUI+zf/7wFULIPRpKaR/yVWJS4g8ytx6vlJDr6xRWHMbAywcG4SXVRqf121rb3h5tlz2w7SlX+b69LzLG/k5DOe1DpD9Q9Hvcexhj/yBamysucdqqHcffEY0zkh4GEeyGzNvjhqUPHKD+jVmFjKlLBUvqQC7vgeLaBZNHNDZcDA1joEJ1GXwYA+9eYBBeUq062bdH++Xz0lL+hajqzwTL6kgu5YGi1mEMTmf832Tveu93EvYR0xQwiAD+qN0e7WoomDMmLRAMFBMS+dTLSB4oWnkYA2/bYRBeUoQQf1rK80xVlwuEXJV29tqjqzyr5475fjDQEhpokCS6Xnu91k8oar0tFUfcw96SE7+MtG4jxMMgnF3Q6/ZoW07RwvGjG640hGZG9eUssyvZwb5DJt7P+0DR6sMYeHnCIJyk8jwphYSpyzjlX8sUpyPDu6tqq2jcdX2sHihafRgDbz9gEA5Ssbg92pYl+4Fit6S+f7Vsy6HQ5JUOf+wwjIGj7dd+PcbXH4RH5fekrNXy9mukt0fbyiQ/UDyTmJR4X2cPFO0wjCF8168pYJAwpGJ9e7QtT48HiteGMbz/f4Sw3ryHqFV3ZsiEmUNSc/KbBeMMLYdBwrTHCLfHDSVG+YGif86olSwYzBc9tdSh/NhXUv2caJzR9TBIFx0y0u3Rvkz/nJQfsqD6jIQDFhp5+rivtMr/WmGhs/bwhtCnI0WHMdT1HJo8KOPZPXUS6jFUChiki3bkp6UUqaq6RLRjMl97dLX2tQeKLTtE6+tIH3qgSKhSztTAC6L5FEV5xlta/aRonBn0MEgnXVqzZOqtLRfPd/pOT6fNpeRkblnt7Xo1v2Du2HsDgabf6rVeB+s09r75lqGPFbx5NoY1RG1pGKQTtH6Pex1jLEOUPHU4lvhKqraIxkWiL3z0e+Oamq68JumBolApZh3GwLtJGKQDUgXLJg0OnL/8kYa/hfrW5z14GxGpTu4DRe5qAkn9+g9fXvT7U9wRJhPCIB00zEy3R9vypT5Q5DjIlCpbfWXVwrcsR2rDSGCQdq0w4+3RdguSHyh2dVDVbt36jujqibxhTnkEhcAg7eCZ9fZofwb8aSllTFVTIzgbXYZSqrzoK6ueE638RskLg7TphNlvjxsOldQHit8+rmYfxsBrQBikDal8j3u9ythiXnjXdbF454q3RomfUPxmSUp/k1tW8yBvDWbWwSCt3bPU7dH+dZXETyiGUlthGAOvaWGQVlL5npSNKlMX8YK7rlMUx1JvaRXP96GLppaqb/2EYmi8kKYvF/26GIsMY+CFC4MQQtYvmjakvj70veaCPzo/NRes7lvyNfPHj29pbgg9UNQ88tThSpiVs7M89ClHW/zAIIQQq98ebU/ytQeK9W8RxgaJnnBKSI1vd+0Y0Tgz621vECu/9ujsYIb+Srn+wpf7REeeWmkYA69pbW8QvydlE2PqQl5gZnjnimcv65+4v2f9p5/+SmDkaUXu7trxPLmtpLG1QTS/9iDk6oR2KxwEzgeK9QmJvSatKD4SmrBoqx9bG8Sut0f7E971h6/oB46EpNScbe/+r62c0bpZ2xqkcMmUoU0XL4h/qYvJ3rniPdSFCyfe0dxYn04YG0YY6UcUWqUoyombRqS8POfJXfW8eayms61B/GkpLzBVXSDaULM89xDdF/QdE7ClQez4zhUMoI2ALQ3i97g3M8bSRZFRp2uZb1eF8Ge2RdeB3jgEbGcQ3B7GOXxmqMR2BtH6fRe4PcxwnOXXaCuD4PaQf4CsntFWBslLc28lKpsv2lTcHqLErKO3jUGu/pHepboPCCGKYPtiNqlEsE7Io0DANgbB7RGF02ODlLYwCG4PG5zkKG3RFgbxe1KKGVPniTJUHM7l3pLKTaJx0FuHgOUNgtvDOoc1FjuxvEHyPCnbCFPnisLF7SFKzJp6SxsEt4c1D62eu7K0QfxpKduZqgpP/8PtoecRNPZaljUIbg9jHzyzVGdZg+D2MMsRNHadljSI1tuDUvLnOycvHTYrKytg7LahOr0IWNIgeR73DsJYmihEqjgzfaWVG0XjoLcuAcsZZM2iqd9pqT+vZcDAqdzdtbdZt9XYmRYCljNIflrK46qq/lQUBm4PUWL20FvOIHke9wHC2FSR9oVee9x298zbU3Pym0XioLU+AcsZxD87+X1GyEiR1uH2EKFlL60FDeJ+gxE2g7eNuD14SdlTZz2DCM67wu1hz4PPu2vLGaRw0QR3U31dBQ8ASuknvrIaoV/HePJCYx0CljNIqDWcc69a4uOTJmRtP1ZlnXZiJ7IJWNIgO/PmJ5wur3iasWBOJ8DOUkdctq/kxG7ZQJHPWgQsaZDrLXo+fdyYQFPzMpWx6YSw/oTSIwpVXjHDdwpa65iZdzeWNoh524LKjUIABjFKJ1CHIQnAIIZsC4oyCgEYxCidQB2GJACDGLItKMooBGAQo3QCdRiSAAxiyLagKKMQgEGM0gnUYUgCMIgh24KijEIABjFKJ1CHIQnAIIZsC4oyCgEYxCidQB2GJACDGLItKMooBGAQo3QCdRiSAAxiyLagKKMQgEGM0gnUYUgCMIgh24KijEIABjFKJ1CHIQnAIIZsC4oyCoFYGoQ4XAn35OwsP2IUGKgDBNoTiKlBFOp4jjjpMaoSl6oQivaAAC8BqioBp9Nx1uVMPLlsy6GTvHGiupgaRLRY6EGgHYFGSkgFVZS3lG7dS7JfeOdD2YRgENlEkS8mBCihHxGH699lzzqDQWLSTiwaJQJ/ciYkPZK97dhRWflhEFkkkccQBCil23xlNY/JKgYGkUUSeQxBgBJaecuwoTPSfv7qJRkFSTPI8/PuntDcUv86IaSHjMKQAwQ0EvjQ5YpbsWrnif/RGH9DmDSDXPvq5foThLAkGYUhBwhoJPChKy5h5aod5W9qjI+OQfau9sad/MO+U4SQ3jIKQw4Q0ESA0qruvW/9wdL1+85pim8XJO0GCeX1e9y/YozdL6Mw5AABLQQoVbb6yqoztMR2FCPVIEWPTRnUWHfhMCPkVlkFIg8ICBB435mUOC976/FKgZgupVINElopf8G477GGpg2MEDchzCGrUOQBga4IUErfdsUl/GTl9uMHZZKSbpBQcesyZwxouHj+71kgMJcQNowQMlBm0cgFAiEClJA/EUpPUkpfTep1046l69/6UjaZqBjkepFFK/66d/OFs+MIY4MZIXGyi0c++xKghDRTp+PkHeMXHJqVlRWIFomoGiRaRSMvCOhFAAbRizTWMSUBGMSUbUPRehGAQfQijXVMSQAGMWXbULReBGAQvUhjHVMSgEFM2TYUrRcBGEQv0ljHlARgEFO2DUXrRQAG0Ys01jElARjElG1D0XoRgEH0Io11TEkABjFl21C0XgRgEL1IYx1TEoBBTNk2FK0XARhEL9JYx5QEYBBTtg1F60UABtGLNNYxJYH/B9+mx5uRjUyUAAAAAElFTkSuQmCC';

class CustomPlugin extends StatefulWidget implements SMDebugPluggable {
  final Dio? dio;
  CustomPlugin({Key? key, required this.dio}) : super(key: key) {
    // 添加监听
    dio?.interceptors.add(SMDioInspector());
    logger.d('----${dio?.interceptors}');
  }

  @override
  _CustomPluginState createState() => _CustomPluginState();

  @override
  Widget buildWidget(BuildContext? context) => this;

  @override
  String get displayName => "网络拦截器";

  @override
  ImageProvider<Object> get iconImageProvider => MemoryImage(base64Decode(iconFontData));

  @override
  IconData get iconData => Icons.access_time;

  @override
  String get name => 'DioInspector';

  @override
  bool get isPushNextPage => true;

  @override
  void onTriggerEvent() {
    logger.d('接收到事件');
    // Get.to(this);
  }
}

class _CustomPluginState extends State<CustomPlugin> {
  @override
  void initState() {
    super.initState();
    SMInspectorInstance.pageNotifier.addListener(_listener);
  }

  @override
  void dispose() {
    SMInspectorInstance.pageNotifier
      ..removeListener(_listener)
      ..resetPaging();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 100),
          width: 80,
          height: 40,
          color: ZSColors.mainRed(),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) => this

  /*
   * @description   监听
   * @param
   * @return
   * @author        jay
   * @time          3/24/22 5:20 PM
   */
  void _listener() {
    Future.microtask(() {
      if (mounted && !context.debugDoingBuild && context.owner?.debugBuilding != true) {
        setState(() {});
      }
    });
  }
}
