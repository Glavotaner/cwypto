import 'package:cwypto/logic/cubits/cipher/cubit/cipher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncryptedText extends StatelessWidget {
  const EncryptedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.read<CipherCubit>().copyEncrypted,
      child: BlocSelector<CipherCubit, CipherState, String>(
        selector: (state) {
          return (state as CipherReady).encrypted;
        },
        builder: (context, encrypted) {
          if (encrypted.isNotEmpty) {
            return Card(
              child: InkWell(
                onTap: () => 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    encrypted,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}
