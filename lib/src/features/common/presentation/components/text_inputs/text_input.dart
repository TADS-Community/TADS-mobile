import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  const TextInput({
    this.textEditingController, Key? key,}) : super(key: key);

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,

    );
  }
}
