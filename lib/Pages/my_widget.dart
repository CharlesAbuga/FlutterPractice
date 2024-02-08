import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double width1 = 20;
  double length1 = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: width1,
                height: length1,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(onPressed: () {
                setState(() {
                  width1 = 30;
                  length1 = 30;
                });
              })
            ]),
      ),
    );
  }
}
