/*
 * <p>------------------------------------------------------
 * <p>Copyright (C) 2020 wasu company, All rights reserved.
 * <p>------------------------------------------------------
 * <p> 日志打印工具类
 * <p>
 * @author Created by chenchen
 * @date  on 2020/7/30
 */
class LogUtils {
  static const String _TAG_DEF = "chenchen";

  static bool debuggable = false; //是否是debug模式,true: log v 不输出.
  static String TAG = _TAG_DEF;

  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, '/e/', object);
  }

  static void v(Object object, {String tag}) {
    if (debuggable) {
      _printLog(tag, '/v/', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? TAG : tag);
    sb.write(stag);
    sb.write(object);
    print(sb.toString());
  }
}