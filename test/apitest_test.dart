import 'package:WasuAuthSDK/auth/result_listener.dart';
import 'package:WasuAuthSDK/auth/wasu_urs_auth.dart';
import 'package:WasuAuthSDK/bean/user_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AuthDemoTestUnit', () async {
    WasuUrsAuth.getInstance().init("c2", "123").setLoggerEnable(true);

    MyListener myListener = MyListener();
    UserInfo userInfo = UserInfo();
    userInfo.nickName = "cici";
    userInfo.password = "cc111111";
    userInfo.phone = "13706810995";
    userInfo.verCode = "645745";
//    await WasuUrsAuth.getInstance().register(userInfo, myListener);

    await WasuUrsAuth.getInstance().sendSMSCode("13706810995");

//    await WasuUrsAuth.getInstance().register(userInfo, myListener);
  });
}

class MyListener implements ResultListener {
  @override
  void onError(String error) {
    // TODO: implement onError
    print("onError：$error");
  }

  @override
  void onFail(String msg) {
    // TODO: implement onFail
    print("onFail：$msg");
  }

  @override
  void onSuccess(String data) {
    // TODO: implement onSuccess
    print(data);
  }
}
