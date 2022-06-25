import 'package:cwypto/logic/cubits/cipher/cubit/cipher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecryptedInput extends StatelessWidget {
  const DecryptedInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: context.read<CipherCubit>().updateEncrypted,
      textAlign: TextAlign.center,
    );
  }
}