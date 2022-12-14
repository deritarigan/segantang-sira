library encrypt;

import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart'
    hide Signer
    hide RSASigner
    hide OAEPEncoding
    hide Algorithm;
import 'package:segantang_sira/security/custom_oaep_encoding.dart';

abstract class AbstractRSA {
  final RSAPublicKey? publicKey;
  final RSAPrivateKey? privateKey;
  PublicKeyParameter<RSAPublicKey>? get _publicKeyParams =>
      publicKey != null ? PublicKeyParameter(publicKey!) : null;
  PrivateKeyParameter<RSAPrivateKey>? get _privateKeyParams =>
      privateKey != null ? PrivateKeyParameter(privateKey!) : null;
  final AsymmetricBlockCipher _cipher = OAEPEncoding(RSAEngine());

  AbstractRSA({
    this.publicKey,
    this.privateKey,
  });
}

/// Wraps the RSA Engine Algorithm.
class RSA extends AbstractRSA implements Algorithm {
  RSA({RSAPublicKey? publicKey, RSAPrivateKey? privateKey})
      : super(publicKey: publicKey, privateKey: privateKey);

  @override
  Encrypted encrypt(Uint8List bytes, {IV? iv}) {
    if (publicKey == null) {
      throw StateError('Can\'t encrypt without a public key, null given.');
    }

    _cipher
      ..reset()
      ..init(true, _publicKeyParams!);

    return Encrypted(_cipher.process(bytes));
  }

  @override
  Uint8List decrypt(Encrypted encrypted, {IV? iv}) {
    if (privateKey == null) {
      throw StateError('Can\'t decrypt without a private key, null given.');
    }

    _cipher
      ..reset()
      ..init(false, _privateKeyParams!);

    return _cipher.process(encrypted.bytes);
  }
}
