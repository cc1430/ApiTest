import 'package:apitest/constant/http_constant.dart';
import 'package:apitest/utils/log_util.dart';
import 'package:dio/dio.dart';

import '../auth/result_listener.dart';

/*
 * <p>------------------------------------------------------
 * <p>Copyright (C) 2020 wasu company, All rights reserved.
 * <p>------------------------------------------------------
 * <p> 网络请求工具类
 * <p>
 * @author Created by chenchen
 * @date  on 2020/7/30
 */
class DioUtils {
  static DioUtils dioUtils;
  Dio dio;
  BaseOptions options;

  /// default options
  static const int CONNECT_TIMEOUT = 5000;
  static const int RECEIVE_TIMEOUT = 3000;

  DioUtils() {
    // 全局属性：请求前缀、连接超时时间、响应超时时间
    options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      responseType: ResponseType.plain,
      validateStatus: (status) {
        //不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: HttpConstant.BASE_URL_URS_OL
    );
    dio = Dio(options);
  }

  static DioUtils getInstance() {
    return dioUtils ?? DioUtils();
  }

  Future<Response> get(String url, {Map<String, dynamic> headParam, Map<String, dynamic> bodyParam, ResultListener listener}) async {
    try {
      LogUtil.v("请求开始--------------------------------------------");
      LogUtil.v("getReq url = $url");
      LogUtil.v("head = $headParam");
      LogUtil.v("body = $bodyParam");
      if(headParam == null || headParam.isEmpty) {
        dio.options.headers = {};
      } else {
        dio.options.headers = headParam;
      }
      Response response = await dio.get(url, queryParameters: bodyParam);
      if (response.statusCode == 200) {
        if (listener != null) {
          listener.onSuccess(response.data);
        }
        LogUtil.v("请求成功: " + response.data);
        LogUtil.v("请求结束--------------------------------------------");
        return response;
      } else {
        if (listener != null) {
          listener.onFail('statusCode:${response.statusCode}');
        }
      }
    } catch (e) {
      LogUtil.e('请求出错：' + e.toString());
      if (listener != null) {
        listener.onError(e.toString());
      }
    }
    return null;
  }

  Future<Response> post(String url, {Map<String, dynamic> headParam, Map<String, dynamic> bodyParam, ResultListener listener}) async {
    LogUtil.v("请求开始--------------------------------------------");
    LogUtil.v("postReq url = $url");
    LogUtil.v("head = $headParam");
    LogUtil.v("body = $bodyParam");
    try {
      if(headParam == null || headParam.isEmpty) {
        dio.options.headers = {};
      } else {
        dio.options.headers = headParam;
      }
      Response response = await dio.post(url, queryParameters: bodyParam);
      if (response.statusCode == 200) {
        if (listener != null) {
          listener.onSuccess(response.data);
        }
        LogUtil.v("请求成功: " + response.data);
        LogUtil.v("请求结束--------------------------------------------");
        return response;
      } else {
        if (listener != null) {
          listener.onFail('statusCode:${response.statusCode}');
        }
      }
    } catch (e) {
      if (listener != null) {
        listener.onError(e.toString());
      }
    }
    return null;
  }

}
