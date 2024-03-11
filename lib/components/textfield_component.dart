// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final String label;
  TextStyle? labelStyle;
  TextEditingController controller;
  TextFieldComponent({
    Key? key,
    required this.label,
    this.labelStyle,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
