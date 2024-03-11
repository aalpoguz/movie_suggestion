// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_suggestion_app/components/textfield_component.dart';

class SecondUserSelection extends StatefulWidget {
  final Function(List arr) onSubmit;
  const SecondUserSelection({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<SecondUserSelection> createState() => _SecondUserSelectionState();
}

class _SecondUserSelectionState extends State<SecondUserSelection> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController4 = TextEditingController();
    final TextEditingController _textController5 = TextEditingController();
    final TextEditingController _textController6 = TextEditingController();
    List<String> user2Movies = [];

    nextStep() {
      setState(() {
        user2Movies.addAll([
          _textController4.text,
          _textController5.text,
          _textController6.text,
        ]);
      });
    }

    return Column(
      children: [
        TextFieldComponent(
            label: '2. kişi için 1. film', controller: _textController4),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '2. kişi için 2. film', controller: _textController5),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '2. kişi için 3. film', controller: _textController6),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            nextStep();
            widget.onSubmit(user2Movies);
          },
          child: const Text("Film Öner"),
        ),
      ],
    );
  }
}
