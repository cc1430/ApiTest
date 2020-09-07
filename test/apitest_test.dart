import 'package:wasuauthsdk/auth/result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';
import 'package:wasuauthsdk/bean/user_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wasuauthsdk/utils/log_utils.dart';

void main() {
  test('AuthDemoTestUnit', () async {
    WasuUrsAuth.getInstance().init("c2", "123", "com.android.wasu.enjoytv").setLoggerEnable(true);

    MyListener myListener = MyListener();
    UserInfo userInfo = UserInfo();
    userInfo.nickName = "cici";
    userInfo.password = "cc111111";
    userInfo.phone = "13706810995";
//    userInfo.uid = "U20200805000200";
    userInfo.verCode = "624424";

    String stbId = "030183762A8BD3A9F4574";

//    await WasuUrsAuth.getInstance().register(userInfo, resultListener: myListener);

//    await WasuUrsAuth.getInstance().sendSMSCode("13706810995");

//    await WasuUrsAuth.getInstance().register(userInfo, resultListener: myListener);

//    await WasuUrsAuth.getInstance().sendLoginSMSCode(userInfo.phone, resultListener: myListener);

//    await WasuUrsAuth.getInstance().callSMSCodeLogin(userInfo.phone, "337251", resultListener: myListener);

//    await WasuUrsAuth.getInstance().callPwdLogin("13706810995", "cc111111", resultListener: myListener);
    String accessToken = "eyJjIjoiL2l4ZEZXTXkyc3JyVVVkK1ZCYzdxeHlXNUgwSDQ2dnBrbXZ6dG5aNDVaaGErNEhoVEZVMUJqUHNSUm1YIFJTYW4xcmtnM3dUOXhOcHNzWHZFVUNwV3pkeVlPa1E3anhvSGFvVnlKL2NaTW5ybXRhZXdva1NXWnUxSyB0WlI3OGNaMEcvVG8xRTFURzdrQjFnZ0RueWxxL1hqdVV1djM2QXpWbExGRTVYQ3JGYVFSYm1ieTgvS2cgakpmdlFtazJwUm1XSW9WbmdtdnI3UmxOWWxud2VVOGRiTkgycC9iUmNNSXhjWFU2ZDRaTlVvZXRXQmV1IHpUaE1WZHZIR09QKy9DWGliamRhaTFMWHdHTnM5QlQ1anpNaG5USVBPOVZSSmhFN3ZlTCsxb3NZVlBaMSAvWFZmK2cwR1hTekxkWmhKeVVQTU5FTmhNcGQxdnF6TmVqZ3FKZTZSQXphaVZNNUlrVmhtK3IyZ0pDSlggRFY1WStvK1ZnOHYrWUJBZ3lkRDZCMTl3VEUzeC9hbkxnM1MzSmEyVm1sRWVTcDFvcWJOOUppVEpiQXpBIDEvcDhiVG1aOWFFT1BuT0tEUHV3WVVGNVk2WGUrckNITVZOQW1DL0xNWjVJVzFWSEJkT1RTWjF3YWh4TiBoSDdsdVBwL2ZZVHRiK1MvK0VCQjdJOVpwS0RQWHNNcnZOTW10eEJNVk0vYVBEWlRJeXdNaXFWOXNIUTMgS3N5Mk9iUDlzcENDLzhxNE40aFJES3lCRncxNzVIS29uYUh6RW8xUFBCYkNLRlpweHNsRXQzRUFnZWozIHR0NGpwQVlBV0M3bjRvb0ppZ0U9IiwiayI6Ikd2WnhLcC9RVFlLUUU2Y1lTM1NLV3pYb3hacWl4NGpEc0gvd2NiUWF3QWNLeU8reElKNUZCanU0QThBU0FoT3d5QXhnYmVMaEU5ZDZFb1U2aE9jYVNvc0lxejVYb2wwczZQY20wRzBMdVBBRWd5UUZOSXJkMlgyQzNoTzI0a3IvZHphcVBQYzU5MG1pa2l6M1pIYkRoc0xYMDN1WFRoaitkVjYyRTZHbVp0cWFMaFZWbk5PYW80Wlh1L0NZRFRzb2RkWFlZMURaY3Yrd0g5bURjMU1panhiZU9FYXFRd3B0dzRtYXNrcEtoRjlrWE1Ub1BQQStSN1ZzcVQvQ1JsZ3grOU5pRzBvVmY5NlB4RFV4R3FBYnZidTJMVVpwOFFwblladWxuU1dUaXRTdzdGUkcweW90NXNvVzRiK3dBYlNubHBIdWZQNGV4Q2hDY0Fzb2RqSkhmQT09IiwibyI6IkFuZHJvaWQifQ==";

//    await WasuUrsAuth.getInstance().callPhoneQuickLogin(accessToken, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getQrCode(stbId, WasuUrsAuth.TOS_TYPE_LOGIN, resultListener: myListener);

    String qrcodeId = "bind-030183762A8BD3A9F4574-730aa079525849d2a80a1a27bdbf8e90";
//    await WasuUrsAuth.getInstance().checkQrcodeStatus(qrcodeId, resultListener: myListener);
    String token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJBTEwiXSwiZXhwIjoxNTk5NDY3OTU4LCJqdGkiOiI4MmM3ZDEyZi05OGU4LTQ1NTktOWNkNS01Yzc0MTg1NDlkNDgiLCJjbGllbnRfaWQiOiJjMiJ9.RCF87E2b-KIwG4ViIQuXG6mVyUjS8SQO-U4Phrp37S2eX_0oyUag9Mk7U25-0z6dPR-Tg2Inn6OHg_f3P5dmjwmumGxZCoSTOSMEnJRhrDvzjP84NVgxwVLlVq_vJLJ3nyEa4fFXk-LWTyKdj_v66w7h_zcfB3eEOXJ1pWhga80N0cyF4m6Wt_YGKI1UNTVCdT_HWusLHL2aZ4Evei43c858-K7H-qk6Z8cjpyw11opAxdFggZJOKcLDKXfT-Q1geB_FNHBOQGinIB6QdhO1C0mwrcjisLJLNbzePYxGgAPvPYo3DK7OMPX8Iix-xLrQ8O2FrFTqhWx-2HyLvM6bzA";
//    await WasuUrsAuth.getInstance().scanOpt(qrcodeId, token, resultListener: myListener);

//    await WasuUrsAuth.getInstance().callAuthLogin(qrcodeId, token, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getUserByUid(token, uid, resultListener: myListener);

//    await WasuUrsAuth.getInstance().updateUser(token, userInfo, resultListener: myListener);

//
//   await WasuUrsAuth.getInstance().bindStbId(stbId, userInfo.phone, WasuUrsAuth.STB_OPT_UNBIND, resultListener: myListener);

  });
}

class MyListener implements ResultListener {
  @override
  void onError(String error) {
    LogUtils.d("onError：$error");
  }

  @override
  void onFail(String msg) {
    LogUtils.d("onFail：$msg");
  }

  @override
  void onSuccess(String data) {
    LogUtils.d(data);
  }
}
