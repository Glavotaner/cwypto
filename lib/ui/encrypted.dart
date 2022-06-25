import 'package:cwypto/logic/cubits/cipher/cubit/cipher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncryptedText extends StatelessWidget {
  const EncryptedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CipherCubit, CipherState, String>(
      selector: (state) {
        return (state as CipherReady).encrypted;
      },
      builder: (context, encrypted) {
        if (encrypted.isNotEmpty) {
          return Card(
            child: InkWell(
              onTap: context.read<CipherCubit>().copyEncrypted,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  encrypted,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.all(30.0),
          child: Text('Please put in somefin...'),
        );
      },
    );
  }
}
