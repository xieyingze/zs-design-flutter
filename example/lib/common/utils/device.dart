/*
 * 全局单例
  */

class DeviceUtils {
  /*
   * 判断当前应用处于debug模式
   */
  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true); //如果debug模式下会触发赋值
    return inDebugMode;
  }
}
