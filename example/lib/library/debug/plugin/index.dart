/*
 * 插件管理
 */
import 'pluggable.dart';

class SMPluginManager {
  static final SMPluginManager _singleton = SMPluginManager._();
  static SMPluginManager get instance => _singleton;
  SMPluginManager._();

  /// 插件Hash表
  Map<String, SMDebugPluggable?> _pluginsMap = {};
  Map<String, SMDebugPluggable?> get pluginsMap => _pluginsMap;

  /// 当前激活的插件
  SMDebugPluggable? _activatedPluggable;
  String? get activatedPluggableName => _activatedPluggable?.name;

  /*
   * @description   注册插件
   * @param
   * @return
   * @author        jay
   * @time          3/23/22 6:22 PM
   */
  void register(SMDebugPluggable plugin) {
    if (plugin.name.isEmpty) {
      return;
    }
    _pluginsMap[plugin.name] = plugin;
  }

  /*
   * @description   注册所有的插件
   * @param         
   * @return        
   * @author        jay    
   * @time          3/23/22 6:26 PM
   */
  void registerAll(List<SMDebugPluggable> plugins) {
    for (final plugin in plugins) {
      assert(plugin is SMDebugPluggable);
      register(plugin);
    }
  }

  /*
   * @description   激活某个插件
   * @param         
   * @return        
   * @author        jay    
   * @time          3/23/22 6:25 PM  
   */
  void activatePluggable(SMDebugPluggable pluggable) {
    _activatedPluggable = pluggable;
  }

  /*
   * @description   冻结某个插件
   * @param         
   * @return        
   * @author        jay    
   * @time          3/23/22 6:25 PM  
   */
  void deactivatePluggable(SMDebugPluggable pluggable) {
    if (_activatedPluggable?.name == pluggable.name) {
      _activatedPluggable = null;
    }
  }
}
