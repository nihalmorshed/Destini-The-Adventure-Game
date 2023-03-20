import 'package:destini/storybrain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Image.asset(
            'images/background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DestiniPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestiniPage extends StatefulWidget {
  DestiniPage({Key? key}) : super(key: key);

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  StoryBrain storyBrain = StoryBrain();

  void checkAnswer(int userPickedAnswer) {
    setState(() {
      storyBrain.updateStory(userPickedAnswer);
      print(storyBrain.getStoryNumber());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                storyBrain.getStoryTitle(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(1);
              },
              child: Text(
                storyBrain.getChoice1(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rubik',
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
        ),
        Visibility(
          visible: storyBrain.buttonShouldBeVisible(),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(2);
                },
                child: Text(
                  storyBrain.getChoice2(),
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                    fontFamily: 'Rubik',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
