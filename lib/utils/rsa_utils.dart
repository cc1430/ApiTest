import 'package:pointycastle/export.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

class RSAUtils {
//    private static Map<Integer, String> keyMap = new HashMap<Integer, String>();  //用于封装随机产生的公钥与私钥

  static const String _RSA_PUBLIC_KEY =
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC04AKjcp" +
          "+ruQ8sQ8k8zO+7wATnEWHjwIfBtSG5\n" +
          "7nyUmUY2lo7qANK+3LxPxqPY0o0ovomwESZCQQzMcPCGSvunvvaidgg2gxJOCpgk29MVcCNkeLHL\n" +
          "rmezRlzcwgIT3E89BJqBp8QgEbemDvf68Xm75a072y9EZuXWPbwJDbK2lwIDAQAB";
  static const String _RSA_PRIVATE_KEY = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALTgAqNyn6u5DyxDyTzM77vABOcR\n" +
      "YePAh8G1IbnufJSZRjaWjuoA0r7cvE/Go9jSjSi+ibARJkJBDMxw8IZK+6e+9qJ2CDaDEk4KmCTb" +
      "\n" +
      "0xVwI2R4scuuZ7NGXNzCAhPcTz0EmoGnxCARt6YO9/rxebvlrTvbL0Rm5dY9vAkNsraXAgMBAAEC" +
      "\n" +
      "gYBj74lFqaVTChK6EFH1x/2FLNkImnANmGjpvByAUKaArBdBPfqEjCPk1K0vHr+UovDfXDdTEoaj" +
      "\n" +
      "ALIDmzsp1/Amk/rkf8lljHnkO7NseT7k9uFTxcZ8LngJ9b7gXDobc+TJaf4vbj2Wl7sSq2gvxflu" +
      "\n" +
      "Xf+cPLENu+PoeFcTGewvEQJBAPvtEyJXSkm910fw+hRPX1axDpD0pFIlBexY6HeSD2lcXjOkdbYH" +
      "\n" +
      "g/LVDStEpU3k4dS60fAQ6MSsndy8TSeh29sCQQC3zMxK7NoG6V1PzF4Wdg0EmkL23dha2+uuXgJv" +
      "\n" +
      "1XjnZuRPpFKyUBTZvoKAuv1rheO6SNzJnMdCOzm8DEemGkr1AkAnhECEGn0kpAqo1jvkA69Iwe0u" +
      "\n" +
      "/7Dm0bfkIu4UE20ncb21DA8KxpMD/Ddcmh/z3/ssi0FzDrP0Zb89aKwRk2oRAkBG+KOiAtcleBL5" +
      "\n" +
      "7zYdgjQApPhajssuOmFFETPrrwhigg6C2ja8d8O1WKTXxFx6mlaW5e+rQgiHAIuIm01HTDvJAkB4" +
      "\n" +
      "DV1TINlnWwjY3tYBqhx0lwfHS6AsyEtBl/McgfRXffyyac/qfUcDc7VainJu7T6kdVNMFD16fOLE" +
      "\n" +
      "wjBV73mt";

  /*
   * RSA公钥加密
   *
   * @param str 加密字符串
   * @return 密文
   * @throws Exception 加密过程中的异常信息
   */
  static Future<String> encrypt(String str) async {
    ///TODO 加密有问题
    RSAPublicKey publicKey = await parseKeyFromFile<RSAPublicKey>('./lib/keys/public_key.pem');
    var encrypter = Encrypter(RSA(publicKey: publicKey));
    var encrypted = encrypter.encrypt(str);
    print("encrypted = " + encrypted.base64);
    return encrypted.base64;
  }

}
