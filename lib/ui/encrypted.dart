import 'package:cwypto/logic/cubits/cipher/cubit/cipher_cubit.dart';
import 'package:cwypto/ui/style/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncryptedText extends StatelessWidget {
  const EncryptedText({Key? key}) : super(key: key);

  final arrow = const Icon(Icons.arrow_downward);

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
                  style: const TextStyle(fontSize: FontSize.large),
                ),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              arrow,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Please put in somefin...',
                  style: TextStyle(
                    fontSize: FontSize.large,
                    color: Colors.black45,
                  ),
                ),
              ),
              arrow,
            ],
          ),
        );
      },
    );
  }
}
