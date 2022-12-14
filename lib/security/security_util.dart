// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' hide RSA;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:segantang_sira/security/rsa_encrypt.dart';

class SecurityUtil {
  static String signData(
      {required String strPublicKey,
      String data = '',
      bool is256Hashed = true}) {
    var requestData = data;
    if (is256Hashed) {
      var byteData = utf8.encode(data);
      var digestData = sha256.convert(byteData);
      requestData = hex.encode(digestData.bytes);
    }
    final parser = RSAKeyParser();
    final key = parser.parse(strPublicKey);
    final publicKey = RSAPublicKey(key.modulus!, key.exponent!);
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    final encrypted = encrypter.encrypt(requestData);
    final hexString = hex.encode(List.from(encrypted.bytes));
    return hexString;
  }

  static String arrangeDataSign(
      String request, String token, String timeStamp) {
    var array = [request, token, timeStamp];
    var sign = '';
    array.sort();
    for (var item in array) {
      sign = sign + item;
    }
    return sign;
  }
}
