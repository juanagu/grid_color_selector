import 'package:flutter/material.dart';
import 'package:grid_color_selector/base_color_grid_selector_item.dart';
import 'package:grid_color_selector/grid_color_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid color selector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid selector sample"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                GridColorSelector<int>(
                  title: "Color",
                  items: _getColors(),
                  onSelectionChanged: (option) => print(option),
                ),
                _buildDivider(),
                GridColorSelector<int>(
                  title: "Color",
                  items: _getColors(),
                  onSelectionChanged: (option) => print(option),
                  itemSize: 100,
                  itemCircleSize: 85,
                  checkSize: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
      ),
      child: Divider(
        height: 2,
        color: Colors.grey,
      ),
    );
  }

  _getColors() {
    return [
      BaseGridColorSelectorItem(
        key: 1,
        primaryColor: Colors.green,
      ),
      BaseGridColorSelectorItem(
        key: 2,
        primaryColor: Colors.blueGrey,
      ),
      BaseGridColorSelectorItem(
        key: 3,
        primaryColor: Colors.red,
      ),
      BaseGridColorSelectorItem(
        key: 4,
        primaryColor: Colors.orange,
        secondaryColor: Colors.blue,
      ),
      BaseGridColorSelectorItem(
        key: 5,
        primaryColor: Colors.yellow,
      ),
      BaseGridColorSelectorItem(
        key: 6,
        primaryColor: Colors.deepPurple,
        secondaryColor: Colors.orange,
        isEnabled: false,
      ),
      BaseGridColorSelectorItem(
        key: 7,
        primaryColor: Colors.white,
        secondaryColor: Colors.blueGrey,
        isEnabled: false,
      ),
      BaseGridColorSelectorItem(
        key: 8,
        primaryColor: Colors.green,
        secondaryColor: Colors.blueGrey,
      ),
      BaseGridColorSelectorItem(
        key: 9,
        primaryColor: Colors.blue,
        secondaryColor: Colors.red,
      ),
    ];
  }
}
