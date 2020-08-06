import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'dart:async';
import 'package:pointycastle/asymmetric/api.dart';

/*
 * <p>------------------------------------------------------
 * <p>Copyright (C) 2020 wasu company, All rights reserved.
 * <p>------------------------------------------------------
 * <p> RSA加解密工具类
 * <p>
 * @author Created by chenchen
 * @date  on 2020/8/5
 */
class RSAUtils {
  /*
   * RSA公钥加密
   *
   * @param str 加密字符串
   * @return 密文
   */
  static Future<String> encrypt(String text) async {
    RSAPublicKey publicKey = await parseKeyFromFile<RSAPublicKey>('keys/public_key.pem');
    var encrypter = Encrypter(RSA(publicKey: publicKey));
    var encrypted = encrypter.encrypt(text);
    return encrypted.base64;
  }

}
