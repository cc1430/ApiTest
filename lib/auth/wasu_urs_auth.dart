import 'dart:convert';

import 'package:wasuauthsdk/auth/result_listener.dart';
import 'package:wasuauthsdk/bean/user_info.dart';
import 'package:wasuauthsdk/constant/http_constant.dart';
import 'package:wasuauthsdk/utils/dio_utils.dart';
import 'package:wasuauthsdk/utils/log_utils.dart';
import 'package:wasuauthsdk/utils/rsa_utils.dart';
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

  String _clientId;
  String _clientSecret;
  String _packageName;
  String _terminal;
  bool _loggerEnable;

  static WasuUrsAuth getInstance() {
    if (wasuUrsAuth == null) {
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
    LogUtils.init(isDebug: enable, tag: "chenchen");
    return this;
  }

  bool isInit() {
    if (wasuUrsAuth == null ||
        wasuUrsAuth._clientId == null ||
        wasuUrsAuth._clientSecret == null) {
      LogUtils.e("未初始化！");
      return false;
    }
    return true;
  }

  /*
   * 注册
   */
  void register(UserInfo userInfo, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }

    if (userInfo == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL + HttpConstant.URS_OL_ADD_USER;

    String token = await _getAccessToken();
    Map<String, dynamic> head = Map();
    head["Authorization"] = "Bearer " + token;

    String paramStr = jsonEncode(userInfo);
    Map<String, dynamic> body = json.decode(paramStr);
    await DioUtils.getInstance().post(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  /*
   * 发送短信验证码
   */
  void sendSMSCode(String phone, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }

    if (phone == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL + HttpConstant.URS_OL_SEND_SMS_CODE;

    String token = await _getAccessToken();
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    Map<String, dynamic> body = Map();
    body["account"] = phone;
    body["busiType"] = HttpConstant.BUSI_TYPE_URS;
    body["sendType"] = HttpConstant.SEND_TYPE_PHONE;
    await DioUtils.getInstance().get(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  /*
   * 发送登录短信验证码
   */
  void sendLoginSMSCode(phone, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }

    if (phone == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_SEND_LOGIN_SMS_CODE;

    String token = await _getAccessToken();
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    Map<String, dynamic> body = Map();
    body["account"] = phone;
    body["sendType"] = HttpConstant.SEND_TYPE_PHONE;
    await DioUtils.getInstance().get(url, bodyParam: body, headParam: head, listener: resultListener);
  }

  /*
   * 客户端模式获取token
   */
  Future<String> _getAccessToken() async {
    String initUrl = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;
    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["grant_type"] = HttpConstant.GRANT_TYPE_CLIENT_CREDENTIALS;
    Response response = await DioUtils.getInstance().post(initUrl, bodyParam: body);
    if (response == null) {
      LogUtils.e("获取令牌失败!");
      return null;
    }
    Map jsonMap = jsonDecode(response.data);
    String token = jsonMap["access_token"];
    return token;
  }

  /*
   * 用户名密码登录
   */
  Future callPwdLogin(String userName, String password, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (userName == null || password == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;

    String token = await _getAccessToken();
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["username"] = userName;
    body["password"] = password; //await RSAUtils.encrypt(password);
    body["grant_type"] = "password";
    await DioUtils.getInstance().post(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  /*
   * 手机验证码登陆
   */
  void callSMSCodeLogin(phone, smsCode, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (phone == null || smsCode == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;

    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["username"] = phone;
    body["smscode"] = smsCode;
    body["grant_type"] = HttpConstant.GRANT_TYPE_SMS_CODE;
    await DioUtils.getInstance().post(url, bodyParam: body, listener: resultListener);
  }

  /*
   * 本机号码快捷登录
   */
  void callPhoneQuickLogin(token, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (token == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;

    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["accesstoken"] = token;
    body["grant_type"] = HttpConstant.GRANT_TYPE_ONCLICK;
    await DioUtils.getInstance().post(url, bodyParam: body, listener: resultListener);
  }

  /*
   * 获取二维码
   */
  void getQrCode(String stbId, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (stbId == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_GEN_QR_CODE;
    Map<String, dynamic> body = Map();
//    body["client_id"] = wasuUrsAuth._clientId;
//    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["resource_no"] = stbId;
    await DioUtils.getInstance().post(url, bodyParam: body, listener: resultListener);
  }

  /*
   * 二维码授权登录
   */
  void callAuthLogin(String qrcodeId, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (qrcodeId == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;
    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["qrcode_id"] = qrcodeId;
    body["grant_type"] = HttpConstant.GRANT_TYPE_SCAN_CODE;
    await DioUtils.getInstance().post(url, bodyParam: body, listener: resultListener);
  }

  /*
   * 刷新token
   */
  void refreshToken(String refreshToken, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (refreshToken == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_AUTH + HttpConstant.OAUTH_TOKEN;
    Map<String, dynamic> body = Map();
    body["client_id"] = wasuUrsAuth._clientId;
    body["client_secret"] = wasuUrsAuth._clientSecret;
    body["refresh_token"] = refreshToken;
    body["grant_type"] = HttpConstant.GRANT_TYPE_REFRESH_TOKEN;
    await DioUtils.getInstance().post(url, bodyParam: body, listener: resultListener);
  }

  /*
   * 查询用户信息
   */
  void getUserByUid(String token, String uid, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (token == null || uid == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL + HttpConstant.URS_OL_GET_BY_UID;
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    Map<String, dynamic> body = Map();
    body["uid"] = uid;
    await DioUtils.getInstance().get(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  /*
   * 修改用户信息
   */
  void updateUser(String token, UserInfo userInfo, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (token == null || userInfo == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL + HttpConstant.URS_OL_EDIT_USER;
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    String paramStr = jsonEncode(userInfo);
    Map<String, dynamic> body = json.decode(paramStr);
    await DioUtils.getInstance().post(url, headParam: head, bodyParam: body, listener: resultListener);
  }

  /*
   * 手机绑定机顶盒
   */
  void bindStbId(String token, String stbId, String phone, String opt, {ResultListener resultListener}) async {
    if (!isInit()) {
      return;
    }
    if (token == null || stbId == null || phone == null || opt == null) {
      LogUtils.e("传入参数有误！");
      return;
    }

    String url = HttpConstant.BASE_URL_URS_OL + HttpConstant.URS_OL_BIND_STB_ID;
    Map<String, dynamic> head = Map();
    head["Authorization"] = HttpConstant.TOKEN_PREFIX + token;

    Map<String, dynamic> body = Map();
    body["phone"] = phone;
    body["stbid"] = stbId;
    body["opt"] = opt;
    await DioUtils.getInstance().get(url, headParam: head, bodyParam: body, listener: resultListener);
  }
}