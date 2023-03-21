import 'package:flutter/material.dart';
import 'package:wikidart/wikidart.dart';

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
  int _selectedIndex = 0;
  Future<WikiResponse?> getWiki() async {
    var res = await Wikidart.searchQuery('Google');
    var pageid = res?.results?.first.pageId;

    if (pageid != null) {
      var google = await Wikidart.summary(pageid);
      return google;

    } else {
      return null;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2,),
            Center(
              child: Text(
                'What is the country of the day? We will find out soon',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FutureBuilder(
                future: getWiki(),
                builder: (ctx, snapshot){
                  return Text(snapshot.data?.description ?? '');
                }),
            const Spacer(flex: 2,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Country", icon: Icon(Icons.home_work_outlined)),
          BottomNavigationBarItem(label: "City", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
