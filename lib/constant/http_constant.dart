/*
 * <p>------------------------------------------------------
 * <p>Copyright (C) 2020 wasu company, All rights reserved.
 * <p>------------------------------------------------------
 * <p> 网络请求宏定义
 * <p>
 * @author Created by chenchen
 * @date  on 2020/7/30
 */
class HttpConstant{

  /// Base url -------------------------------------------------------------
  /// 测试环境
  static const String BASE_URL_URS_AUTH_TEST = "http://125.210.163.116:6060/urs-auth/oauth";
  static const String BASE_URL_URS_OL_TEST = "http://125.210.163.113:8089/urs-ol";

  /// 正式环境
  static const String BASE_URL_URS_AUTH = "http://apigw-gateway.wasumedia.cn/uamauth/oauth";
  static const String BASE_URL_URS_OL = "http://apigw-gateway.wasumedia.cn/uamol";

  /// Request path -------------------------------------------------------------

  /// urs-ol接口：新增用户
  static const String URS_OL_ADD_USER = "/user/addUser";

  /// urs-ol接口：发送短信验证码
  static const String URS_OL_SEND_SMS_CODE = "/sms/sendSMSCode";

  /// oauth接口： 获取令牌
  static const String OAUTH_TOKEN = "/token";

  /// Parameter def -------------------------------------------------------------
  static const String AUTH_TOKEN_PREFIX = "Bearer ";
  static const String URS_OL_BUSITYPE = "urs";
  static const String URS_OL_SENDTYPE = "phone";
  static const String OAUTH_GRANT_TYPE = "client_credentials";
}