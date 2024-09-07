import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Draggable1 extends StatelessWidget {
  const Draggable1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                width: 200,
                child: Draggable(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 200,
                  ),
                  feedback: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 200,
                  ),
                  childWhenDragging: Container(
                    height: 200,
                    width: 200,
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
