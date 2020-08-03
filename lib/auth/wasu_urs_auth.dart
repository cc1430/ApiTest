import 'dart:convert';

import 'package:WasuAuthSDK/auth/result_listener.dart';
import 'package:WasuAuthSDK/bean/user_info.dart';
import 'package:WasuAuthSDK/constant/http_constant.dart';
import 'package:WasuAuthSDK/utils/dio_util.dart';
import 'package:WasuAuthSDK/utils/log_util.dart';
import 'package:dio/dio.dart';

/*
 * <p>------------------------------------------------------
 * <p>Copyright (C) 2020 wasu company, All rights reserved.
 * <p>------------------------------------------------------
 * <p> 统一认证服务类
 * <p>
 * @author Created by chenchen
 * @date  on 2020/7/30
 */
class WasuUrsAuth {

  static WasuUrsAuth wasuUrsAuth;

  String _accessToken;

  String _clientId;
  String _clientSecret;
  String _packageName;
  String _terminal;
  bool _loggerEnable;

  static WasuUrsAuth getInstance() {
    if(wasuUrsAuth == null) {
      wasuUrsAuth = WasuUrsAuth();
    }
    return wasuUrsAuth;
  }

  WasuUrsAuth init(String clientId, String clientSecret) {
    wasuUrsAuth._clientId = clientId;
    wasuUrsAuth._clientSecret = clientSecret;
    return this;
  }

  WasuUrsAuth setPackageId(String packageName) {
    wasuUrsAuth._packageName = packageName;
    return this;
  }

  WasuUrsAuth setTerminal(String terminal) {
    wasuUrsAuth._terminal = terminal;
    return this;
  }

  WasuUrsAuth setLoggerEnable(bool enable) {
    wasuUrsAuth._loggerEnable = enable;
    LogUtil.init(isDebug: enable, tag: "chenchen");
    return this;
  }

  bool isInit(){
    if(wasuUrsAuth == null || wasuUrsAuth._clientId == null || wasuUrsAuth._clientSecret == null) {
      LogUtil.e("未初始化！");
      return false;
    }
    return true;
  }

  void register(UserInfo userInfo, ResultListener resultListener) async {
    if(!isInit()) {
      return;
    }

    if(userInfo == null) {
      LogUtil.e("传入参数有误！");
      return;
    }

    if(!await _checkToken()) {
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL_TEST + HttpConstant.URS_OL_ADD_USER;
    Map<String, dynamic> head = Map();
    head["Authorization"] = "Bearer " + _accessToken;
    String paramStr = jsonEncode(userInfo);
    Map<String, dynamic> body = json.decode(paramStr);
    await DioUtils.getInstance().post(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  void sendSMSCode(String phone) async {
    if(phone == null) {
      LogUtil.e("传入参数有误！");
      return;
    }

    bool success = await _checkToken();
    if(!success) {
      LogUtil.e("token获取失败！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL_TEST + HttpConstant.URS_OL_SEND_SMS_CODE;
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.AUTH_TOKEN_PREFIX + _accessToken;

    Map<String, dynamic> param = Map();
    param["account"] = phone;
    param["busiType"] = HttpConstant.URS_OL_BUSITYPE;
    param["sendType"] = HttpConstant.URS_OL_SENDTYPE;
    await DioUtils.getInstance().get(url, headParam: head, bodyParam: param);
  }

  Future<bool> _checkToken() async{
    if(_accessToken == null) {
      String token = await _getAccessToken();
      if(token != null) {
        _accessToken = token;
      } else {
        return false;
      }
    }
    return true;
  }

  String getToken() {
    return _accessToken;
  }

  Future<String> _getAccessToken() async {
    if(!isInit()) {
      return null;
    }

    String initUrl = HttpConstant.BASE_URL_URS_AUTH_TEST + HttpConstant.OAUTH_TOKEN;
    Map<String, dynamic> map = Map();
    map["client_id"] = wasuUrsAuth._clientId;
    map["client_secret"] = wasuUrsAuth._clientSecret;
    map["grant_type"] = HttpConstant.OAUTH_GRANT_TYPE;
    Response response = await DioUtils.getInstance().post(initUrl, bodyParam: map);
    if(response == null) {
      LogUtil.e("获取令牌失败!");
      return null;
    }
    Map jsonMap = jsonDecode(response.data);
    String token = jsonMap["access_token"];
    return token;
  }
}
