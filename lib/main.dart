import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<String> items = [];
   final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  bool visible = true;

  final myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*try {
    positionAnimation = List.generate(items.length, (index) => Tween(begin: const Offset(-20, 0), end: Offset.zero).animate(CurvedAnimation(parent: animController, curve: Curves.bounceIn)));
    
  } catch (e) {
    print(e);
  }
  */
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Text Edit Test';
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  hintText: 'Type a word or sentence',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final item = myController.text.toString();
                  setState(() {
                    items.add(item);
                    myController.clear();
                     _animatedListKey.currentState?.insertItem(items.length - 1); //Here is where the the new listtile item is updated
                  });
               
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 70),
            Expanded(
              child: AnimatedList(
                key: _animatedListKey,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.purple[200],
                        child: ListTile(
                          title: Center(
                            child: Text(items[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
