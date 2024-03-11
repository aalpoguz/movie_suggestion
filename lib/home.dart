import 'package:flutter/material.dart';
import 'package:movie_suggestion_app/views/movie_selection_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GEMINI AI'),
        centerTitle: true,
      ),
      body: const MovieSelectionScreen(),
    );
  }
}
