// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ResultScreen extends StatefulWidget {
  final List<String> movieList;
  const ResultScreen({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String generatedText = "";
  bool isLoading = true;
  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: "YOUR_API_KEY",
  );
  _getMovieSuggestion() async {
    final content = [
      Content.text(
          'buradaki filmleri ${widget.movieList.join(", ")} seviyorum. bana bunların ortak noktalarından oluşan 5 tane film önerir misin?')
    ];
    final response = await model.generateContent(content);

    setState(() {
      generatedText = response.text!;
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getMovieSuggestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading && widget.movieList.isNotEmpty
        ? const Center(child: CircularProgressIndicator())
        : widget.movieList.isNotEmpty
            ? Text(
                generatedText,
                style: const TextStyle(fontSize: 16.0),
              )
            : Container();
  }
}
