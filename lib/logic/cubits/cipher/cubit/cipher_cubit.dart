import 'package:api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'cipher_state.dart';

class CipherCubit extends Cubit<CipherState> {
  CipherCubit({ required Cipher cipher }) : super(CipherReady(cipher: cipher));

  updateEncrypted(String phrase) {
    emit((state as CipherReady).updated(phrase));
  }

  copyEncrypted() {
    final clipboardData = ClipboardData(text: (state as CipherReady).encrypted);
    Clipboard.setData(clipboardData);
  }
}
