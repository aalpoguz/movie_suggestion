// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_suggestion_app/components/textfield_component.dart';

class FirstUserMovieSelection extends StatefulWidget {
  final Function(List arr) onSubmit;
  const FirstUserMovieSelection({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<FirstUserMovieSelection> createState() =>
      _FirstUserMovieSelectionState();
}

class _FirstUserMovieSelectionState extends State<FirstUserMovieSelection> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController1 = TextEditingController();
    final TextEditingController _textController2 = TextEditingController();
    final TextEditingController _textController3 = TextEditingController();
    List<String> user1Movies = [];

    _nextStep() {
      setState(() {
        user1Movies.addAll([
          _textController1.text,
          _textController2.text,
          _textController3.text,
        ]);
      });
    }

    return Column(
      children: [
        TextFieldComponent(
            label: '1. kişi için 1. film', controller: _textController1),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '1. kişi için 2. film', controller: _textController2),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '1. kişi için 3. film', controller: _textController3),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _nextStep();
            widget.onSubmit(user1Movies);
          },
          child: const Text("İleri"),
        ),
      ],
    );
  }
}
