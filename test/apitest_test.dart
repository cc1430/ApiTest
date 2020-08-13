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

//    await WasuUrsAuth.getInstance().callPhoneQuickLogin("", resultListener: myListener);

//    await WasuUrsAuth.getInstance().getQrCode(stbId, WasuUrsAuth.TOS_TYPE_LOGIN, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getUserByUid(token, uid, resultListener: myListener);

//    await WasuUrsAuth.getInstance().updateUser(token, userInfo, resultListener: myListener);

//    String token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJBTEwiXSwiZXhwIjoxNTk3MjA5NjE0LCJqdGkiOiI0MzEwYTcxNC0yODliLTQxMGEtOGFhNy0zMjUzODFhMTk0YzQiLCJjbGllbnRfaWQiOiJjMiJ9.ZwR1RfZq9QocTBnhGIuNeNX7nKy0jXOPY5kdsoE07fOlpkeIS_IWcY_snoDNeLQg10SwzT08q008AIDjcE4DH4RICwy065I59CaiHNHIfPSkSQLdyOVvoO_T6wSFq_lV3r2_Gg5U9LNIit7UVVVC2f1DYyLWdegDST95Kz9Kq1dF7szdNoIeVAuuVIVMnOO6f7xz5qGphE643mU6YAnKpwlkQKCnxZyBK_ih8nxI9EirvF3WN2lw9Jx1uvToEquOxIgbRjj0PXViKBH-UlS1TQttRm6_oPKOifWmqncYy7HFOVz_YcTwjTkGQaz4Yl_Wh--v6S9QoQUfGjdg32TPYw";
//  await WasuUrsAuth.getInstance().bindStbId(token, stbId, userInfo.phone, WasuUrsAuth.STB_OPT_UNBIND, resultListener: myListener);

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
