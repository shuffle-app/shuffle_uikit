import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatelessWidget {
  const AllWidgetsStand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Flutter Built-in Widgets',
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        children: <Widget>[
          const Text('Basic Widgets'),
          const Text('Text'),
          const Center(
            child: Text('Centered Text'),
          ),
          const SizedBox(height: 16),
          const Text('Buttons'),
          ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
          const SizedBox(height: 16),
          const Text('Input Fields'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter some text',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Selection Widgets'),
          CheckboxListTile(
            title: const Text('Checkbox'),
            value: false,
            onChanged: (_) {},
          ),
          const SizedBox(height: 8),
          RadioListTile<int>(
            title: const Text('Radio 1'),
            value: 1,
            groupValue: null,
            onChanged: (_) {},
          ),
          RadioListTile<int>(
            title: const Text('Radio 2'),
            value: 2,
            groupValue: null,
            onChanged: (_) {},
          ),
          const SizedBox(height: 16),
          const Text('Layout Widgets'),
          const Center(
            child: Text('Container'),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Row'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Column'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Expanded'),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Flexible'),
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Stack'),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Material Components'),
          const Center(
            child: Text('AppBar'),
          ),
          AppBar(
            title: const Text('AppBar Title'),
            actions: const <Widget>[
              Icon(Icons.search),
              Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('BottomNavigationBar'),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Card'),
          ),
          Card(
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Text('Card Title'),
                  subtitle: Text('Card Subtitle'),
                  leading: Icon(Icons.album),
                ),
                const ListTile(
                  title: Text('Card Content 1'),
                ),
                const ListTile(
                  title: Text('Card Content 2'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Chip'),
          ),
          Wrap(
            children: const <Widget>[
              Chip(
                label: Text('Chip 1'),
              ),
              Chip(
                label: Text('Chip 2'),
              ),
              Chip(
                label: Text('Chip 3'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Dialog'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('Dialog Content'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show Dialog'),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Progress Indicator'),
          ),
          const LinearProgressIndicator(),
          const SizedBox(height: 8),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
