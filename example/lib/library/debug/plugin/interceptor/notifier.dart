import 'dart:math' as math;

import 'package:dio/dio.dart' show Response;
import 'package:flutter/widgets.dart';

//////////////////////////// Page Notifier ////////////////////////////
class SMInterceptorPageNotifier extends ChangeNotifier {
  /*
   * @description   响应集合
   * @param
   * @return
   * @author        jay
   * @time          3/24/22 5:06 PM
   */
  List<Response<dynamic>> get requests => _requests;
  final List<Response<dynamic>> _requests = <Response<dynamic>>[];

  /// 当前页数
  int get page => _page;
  int _page = 1;

  /// 每页大小
  final int _perPage = 10;

  /*
   * @description    Return requests according to the paging.
   * @param         
   * @return        
   * @author        jay    
   * @time          3/24/22 5:03 PM  
   */
  List<Response<dynamic>> get pagedRequests {
    return _requests.sublist(0, math.min(page * _perPage, _requests.length));
  }

  /*
   * @description   If Have Next Page?
   * @param         
   * @return        
   * @author        jay    
   * @time          3/24/22 5:03 PM  
   */
  bool get _hasNextPage => _page * _perPage < _requests.length;

  void addRequest(Response<dynamic> response) {
    _requests.insert(0, response);
    notifyListeners();
  }

  /*
   * @description   加载下一页
   * @param         
   * @return        
   * @author        jay    
   * @time          3/24/22 5:04 PM  
   */
  void loadNextPage() {
    if (!_hasNextPage) {
      return;
    }
    _page++;
    notifyListeners();
  }

  /*
   * @description   重置页数
   * @param         
   * @return        
   * @author        jay    
   * @time          3/24/22 5:04 PM  
   */
  void resetPaging() {
    _page = 1;
    notifyListeners();
  }

  /*
   * @description   清楚所有的响应
   * @param         
   * @return        
   * @author        jay    
   * @time          3/24/22 5:04 PM  
   */
  void clearRequests() {
    _requests.clear();
    _page = 1;
    notifyListeners();
  }

  @override
  void dispose() {
    _requests.clear();
    super.dispose();
  }
}
