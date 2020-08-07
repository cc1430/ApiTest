import 'package:wasuauthsdk/auth/result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';
import 'package:wasuauthsdk/bean/user_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wasuauthsdk/utils/log_utils.dart';

void main() {
  test('AuthDemoTestUnit', () async {
    WasuUrsAuth.getInstance().init("c2", "123").setLoggerEnable(true);

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

//    await WasuUrsAuth.getInstance().callSMSCodeLogin(userInfo.phone, "272076", resultListener: myListener);

//    await WasuUrsAuth.getInstance().callPwdLogin("13706810995", "cc111111", resultListener: myListener);

//    await WasuUrsAuth.getInstance().callPhoneQuickLogin("", resultListener: myListener);

//    await WasuUrsAuth.getInstance().getQrCode(stbId, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getUserByUid(token, uid, resultListener: myListener);

//    wait WasuUrsAuth.getInstance().updateUser(token, userInfo, resultListener: myListener);
  });
}

class MyListener implements ResultListener {
  @override
  void onError(String error) {
    LogUtils.e("onError：$error");
  }

  @override
  void onFail(String msg) {
    LogUtils.e("onFail：$msg");
  }

  @override
  void onSuccess(String data) {
    LogUtils.v(data);
  }
}
