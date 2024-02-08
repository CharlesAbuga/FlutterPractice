import 'package:flutter/material.dart';

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
                    if (item.isEmpty){
                      return ;
                    }else{
                      items.add(item);
                    }
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
