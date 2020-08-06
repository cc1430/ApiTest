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

//    await WasuUrsAuth.getInstance().callPwdLogin("13706810995", "cc111111", resultListener: myListener);

//    await WasuUrsAuth.getInstance().callPhoneQuickLogin("", resultListener: myListener);

//    await WasuUrsAuth.getInstance().getQrCode(stbId, resultListener: myListener);

//    await WasuUrsAuth.getInstance().getUserByUid(token, uid, resultListener: myListener);

//    String token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJBTEwiXSwiZXhwIjoxNTk2NjEyNDQ1LCJqdGkiOiJmOGNiZjEzOC02MGY2LTQ2NDItYTUxMi0zZDFmOGY3ZjZkYzEiLCJjbGllbnRfaWQiOiJjMiJ9.C9Lr7x05pP5Lrg0Rp_YA0qfTHfelYRKYCq8nQUW0ST8-HjLQh7Nf-An7ZpDAMzQRxGySRZKRKDpU38oapMX1GJA2F3LHIqBTLxiDXnBmh_85i_QsmBPWPmSaVFLzkXnL2VDDSeWeiz1j46w256k28fTIZRcyrSrjz8bM5IwUpmIYW0KRLtiimDmuk4mM7vDFY_78JnUsXnT7MsJwfF_CnSQI812gO9LWnjTEDxWsETnWyhNheYoUWWIsHpvXSNQeZa6ZPE5ZwRIY6nRjJ9HJprSDqd6ivZNwM1GJu-j1SHBUbpZ3r56AEFVUp1hI1KZmFXzqBIidy0FAs80rd9y6fQ";

//     await WasuUrsAuth.getInstance().updateUser(token, userInfo, resultListener: myListener);
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
