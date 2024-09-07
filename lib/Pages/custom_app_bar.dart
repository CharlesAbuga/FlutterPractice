import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  static const List<String> _kOptions = <String>[
    'pizza',
    'maserati',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Custom AppBar'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Text(
                'Type the following words to see if autocomplete works ',
                style: TextStyle(fontSize: 12),
              ),
              Material(
                child: Autocomplete<String>(
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onSubmitted: (String value) {
                        onFieldSubmitted();
                      },
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _kOptions.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    print('You just selected $selection');
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ]),
          ),
        ),
      );
    } else if (Platform.isIOS) {
      return MaterialApp(
        home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Custom AppBar'),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Text(
                    'Type the following words to see if autocomplete works ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Material(
                    child: Autocomplete<String>(
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                        return CupertinoTextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (String value) {
                            onFieldSubmitted();
                          },
                        );
                      },
                      optionsViewBuilder: (context, onSelected, options) =>
                          CupertinoListSection(
                        children: options
                            .map((String option) => CupertinoListTile(
                                  onTap: () => onSelected(option),
                                  title: Text(option),
                                ))
                            .toList(),
                      ),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        print('You just selected $selection');
                      },
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  CupertinoButton(
                      child: Text('Submit'),
                      color: Colors.blue,
                      onPressed: () {}),
                ]),
              ),
            ),
          ),
        ),
      );
    }
    return Text('Platform not supported');
  }
}
