part of 'cipher_cubit.dart';

@immutable
abstract class CipherState extends Equatable {}

class CipherReady extends CipherState {
  final Cipher _cipher;
  CipherReady({ required Cipher cipher }) : _cipher = cipher;
  CipherReady updated(String decrypted) {
    final updatedCipher = _cipher.copyWith(decrypted: decrypted);
    return CipherReady(cipher: updatedCipher);
  }
  String get encrypted => _cipher.encrypted;
  String get decrypted => _cipher.decrypted;
  @override
  List<Object?> get props => [encrypted, decrypted];
}
