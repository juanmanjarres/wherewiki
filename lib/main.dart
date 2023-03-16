import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wherewiki?',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true
      ),
      home: const MyHomePage(title: 'Wherewiki?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'What is the country of the day? We will find out soon',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Country", icon: Icon(Icons.home_work_outlined)),
          BottomNavigationBarItem(label: "City", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
