import 'package:flutter/material.dart';
import 'package:movie_suggestion_app/components/first_user_selection.dart';
import 'package:movie_suggestion_app/components/second_user_selection.dart';
import 'package:movie_suggestion_app/views/result_screen.dart';

class MovieSelectionScreen extends StatefulWidget {
  const MovieSelectionScreen({Key? key}) : super(key: key);

  @override
  _MovieSelectionScreenState createState() => _MovieSelectionScreenState();
}

class _MovieSelectionScreenState extends State<MovieSelectionScreen> {
  List<String> movieList = [];
  int _currentStep = 0;

  bool isLoading = false;
  late List<Widget> myWidgets;

  changeStep() {
    setState(() {
      _currentStep++;
    });
  }

  onSubmit(val) {
    setState(() {
      movieList = [...movieList, ...val];
    });
    if (_currentStep < 2) {
      changeStep();
    }
  }

  fillMyWidgets() {
    myWidgets = [
      FirstUserMovieSelection(
        onSubmit: onSubmit,
      ),
      SecondUserSelection(
        onSubmit: onSubmit,
      ),
      ResultScreen(
        movieList: movieList,
      )
    ];
    setState(() {});
  }

  @override
  void initState() {
    fillMyWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Önerisi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              myWidgets[_currentStep],
              if (_currentStep == 2)
                ResultScreen(
                  movieList: movieList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
