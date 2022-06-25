import 'package:cipher/cipher.dart';
import 'package:cwypto/logic/cubits/cipher/cubit/cipher_cubit.dart';
import 'package:cwypto/ui/decrypted.dart';
import 'package:cwypto/ui/encrypted.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CwyptoApp());
}

class CwyptoApp extends StatelessWidget {
  const CwyptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Cwypto'),
      ),
      body: BlocProvider(
        create: (context) =>
            CipherCubit(cipher: const CipherImpl.decrypted('')),
        child: Builder(
          builder: ((context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                EncryptedText(),
                DecryptedInput(),
              ],
            );
          }),
        ),
      ),
    ));
  }
}
