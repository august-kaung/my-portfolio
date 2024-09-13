import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

class CryptoJS {
  Uint8List genRandomWithNonZero(int seedLength) {
    final Uint8List uint8list = Uint8List(seedLength);
    return uint8list;
  }

  Uint8List ivRandom(int seedLength) {
    var params = Uint8List(seedLength)
      ..[0] = 4
      ..[1] = 16;
    var iv = params.sublist(2);
    return iv;
  }

  Future<Uint8List> deriveKeyAndIV(String passphrase, Uint8List salt) async {
    Pbkdf2 currentHash = Pbkdf2(
      macAlgorithm: Hmac.sha1(),
      iterations: 1000,
      bits: 128,
    );

    SecretKey secretkey = await currentHash.deriveKey(
      secretKey: SecretKey(utf8.encode(passphrase)),
      nonce: salt,
    );

    List<int> listInt = await secretkey.extractBytes();
    Uint8List ac = Uint8List.fromList(listInt);

    return ac;
  }

  dynamic setEncrypt(String plaintext) async {
    final salt = CryptoJS().genRandomWithNonZero(16);
    final key = await CryptoJS().deriveKeyAndIV('!@#\$29!@#\$Gk**&*', salt);
    final adjustkey = encrypt.Key(key);
    final iv = CryptoJS().ivRandom(18);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(adjustkey, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
    final encrypted = encrypter.encrypt(plaintext, iv: encrypt.IV(iv));
    final encorgid = encrypted.base64;
    return encorgid;
  }

  dynamic getDecrypt(String encString) async {
    String? result;
    final salt = CryptoJS().genRandomWithNonZero(16);
    final key = await CryptoJS().deriveKeyAndIV('!@#\$29!@#\$Gk**&*', salt);
    final adjustkey = encrypt.Key(key);
    final iv = CryptoJS().ivRandom(18);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(adjustkey, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
    final decrypted = encrypter.decrypt64(encString, iv: encrypt.IV(iv));
    result = decrypted;

    return result;
  }
}
