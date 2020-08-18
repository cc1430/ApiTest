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

    String qrcodeId = "bind-030183762A8BD3A9F4574-730aa079525849d2a80a1a27bdbf8e90";
//    await WasuUrsAuth.getInstance().checkQrcodeStatus(qrcodeId, resultListener: myListener);
    String token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJVMjAyMDA4MTQwMDAxOTkiLCJ1c2VyX25hbWUiOiJ7XCJhdmF0YXJ1cmxcIjpcIlwiLFwiZW1haWxcIjpcIlwiLFwibmlja25hbWVcIjpcImNpY2lcIixcInBob25lXCI6XCIxMzcwNjgxMDk5NVwiLFwic3RhdGVcIjowLFwidWlkXCI6XCJVMjAyMDA4MTQwMDAxOTlcIixcInVzZXJuYW1lXCI6XCIxMzcwNjgxMDk5NVwifSIsInNjb3BlIjpbIkFMTCJdLCJleHAiOjE1OTc2NjI3OTgsImF1dGhvcml0aWVzIjpbImFsbCJdLCJqdGkiOiIyY2RlYTU1NS02ZGYzLTQ1MjQtOTk4Yi04MjQwMDA0MGQzN2EiLCJjbGllbnRfaWQiOiJjMiJ9.AGpq85YqKVggkl9LEfmdkJRRc6wtpoQy41QZMlMzpJzJ147uQicjOf7qiKZeXRHf-P8XEMc7BTrDCA5eWXdZlOLTYvlcqhzdH33_HzSkRGUeNkMzxQ-IuoG_9fOHtvZ9HSLki5ONXodLPPq05bNVsS6jWLmq8gF3FSAveBkS1fEQdkF6grm-ML7tvw1XsfXyDlvWVufwUhhnEmrozAp8vxeRf0OqvmFKE1ei_ffCgx9ZTYJI7UhH-lI9xIFUztRqNLoZwUdYhSo-Y2efISFD89LcSj6UNgPN6tc6kAtnP5wo-F6qFz0PiNZshD2mBw9YHaAxVJjU9AOyLT_3X4xnwA";
//    await WasuUrsAuth.getInstance().scanOpt(qrcodeId, token, resultListener: myListener);

//    await WasuUrsAuth.getInstance().callAuthLogin(qrcodeId, token, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getUserByUid(token, uid, resultListener: myListener);

//    await WasuUrsAuth.getInstance().updateUser(token, userInfo, resultListener: myListener);

//
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
