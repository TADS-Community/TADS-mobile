import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final bool hidden;
  final Function(String) onTapSuffix;
  final String hintText;
  final String text;
  final String? labelText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const ProfileTextInput({
    this.validator,
    this.hidden = false,
    required this.onTapSuffix,
    required this.hintText,
    required this.text,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters = const [],
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTextInput> createState() => _ProfileTextInputState();
}

class _ProfileTextInputState extends State<ProfileTextInput> {
  final controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _focused = false;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {
        _focused = _focus.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focus,
      maxLines: 1,
      maxLength: 20,
      controller: controller..text = widget.text,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      style: const TextStyle(fontSize: 18),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIconColor: Colors.red,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _focused
            ? Transform.scale(
                scale: 0.7,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    widget.onTapSuffix(controller.text);
                  },
                ),
              )
            : null,
        counterText: '',
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
      ),
    );
  }
}
