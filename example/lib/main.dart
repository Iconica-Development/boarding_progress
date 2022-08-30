import 'package:boarding_progress/boarding_progress.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BoardingProgressDemo()));
}

class BoardingProgressDemo extends StatelessWidget {
  const BoardingProgressDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.height * 0.1,
          right: size.width * 0.05,
        ),
        child: BoardingProgress(
          header: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        child: Icon(
                          Icons.face,
                        ),
                      ),
                      const Text('Will'),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width * 0.7,
                    child: const Text(
                      'Hoi Arjan, welkom bij Stadscafe Simons! '
                      'We zien dat je nog redelijk nieuw bent, '
                      'Wil je beginnen met een van de onder '
                      'staande elementen?',
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.08),
            ],
          ),
          pages: [
            const BoardingProgressPage(
              title: 'Wie ben je?',
              subtitle: 'Hobbies, wat vind je leuk om te doen?',
              content: Text('inputfield'),
            ),
            const BoardingProgressPage(
              title: 'Upload profiel foto',
              subtitle: 'Laat je zien aan je collega\'s',
              content: CircleAvatar(),
            ),
            BoardingProgressPage(
              title: 'Smoelenboek',
              subtitle: 'Wat mogen je collega\'s zien?',
              content: Column(
                children: [
                  const Text('inputfield'),
                  const Text('inputfield'),
                  const Text('inputfield'),
                ],
              ),
            ),
            BoardingProgressPage(
              title: 'Afronding',
              subtitle: 'Start met ontdekken van de app!',
              content: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
